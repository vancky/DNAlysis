function [ output ] = CameraCorrelation( config, importedImages )
    % Camera Correlation - Correlates the different came
    %   Detailed explanation goes here

    
    % Import the laser images!
    output.laserImages=importedImages;
    
    % NOTE: TESTCASE ONLY FOR LASER 2, WE CAN LOOP OVER ALL LASERS LATER ON
    
    % Split the image horizontal and make a crop in the vertical direction
    % to make sure that we can perform proper convolution
    
    splitImage=SplitImage(output.laserImages{2}.cam0 , 1);
    halfRow=size(splitImage.rightImage,1);
    halfCol=size(splitImage.rightImage,2);
    output.croppedImage=splitImage.rightImage( 1+halfRow/4 : 3*halfRow/4 , : );   

    % BEUNFIX!
    
    filteredImage=output.laserImages{2}.cam1;
%     output.croppedImage=RollingBallFilter(output.croppedImage,30);
%     filteredImage=RollingBallFilter(output.laserImages{2}.cam1,30);
    filteredImage(filteredImage<1100)=0;
    filteredImage(:,1:90)=0;
    filteredImage(:,422:512)=0;
    output.croppedImage(output.croppedImage<300)=0;
    
    % Perform the Correlation
    
    output.correlation=conv2( filteredImage , output.croppedImage , 'valid');
   
    % Find the index of maximum correlation
    
    [maxValue , output.maxIndex]=max(output.correlation(:));
    [output.rowIndex, output.colIndex] = ind2sub(size(output.correlation),output.maxIndex);  
    rowCorrection=output.rowIndex-halfRow/4;
    colCorrection=output.colIndex;
    
   % Perform the correction
    
    output.rightImageCorrected=zeros(size(output.laserImages{2}.cam1));
    for i=1:halfCol
        for j=1:halfRow
            if (j+rowCorrection > 0 && j+rowCorrection<=config.pixels)
                output.rightImageCorrected( j+rowCorrection ,i+colCorrection)=(splitImage.rightImage(j,i));
            end
        end
    end

    
    % Visualisation of the correlation
    
    avgRight=sum(splitImage.rightImage(:))/(halfRow*halfCol);
    avgCam1=sum(output.laserImages{2}.cam1(:))/(config.pixels^2);
    scaleFactor=avgCam1/avgRight;
    
    figure;
    imshow(output.croppedImage,[])
    figure;
    imshow(output.rightImageCorrected,[])
    figure;
    imshow(filteredImage,[])
    figure;
    imshow(output.correlation,[])
    
    figure;
    blockSize=10; %config.checkerBoardSize;           % blocksize for the checkerboard pattern
    
    %CompareSplit( scaleFactor*output.rightImageCorrected , output.laserImages{2}.cam1 , blockSize) ; title('With correlation')

end

