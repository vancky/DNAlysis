function [ output ] = CameraCorrelation( config, importedImages )
    % Camera Correlation - Correlates the different came
    %   Detailed explanation goes here

    
    % Import the laser images!
    output.laserImages=importedImages;
    
    % NOTE: TESTCASE ONLY FOR LASER 2, WE CAN LOOP OVER ALL LASERS LATER ON
    
    % Split the image horizontal and make a crop in the vertical direction
    % to make sure that we can perform proper correlation
    
    splitImage=SplitImage(output.laserImages{2}.cam0 , 1);
    halfRow=size(splitImage.rightImage,1);
    halfCol=size(splitImage.rightImage,2);
    output.croppedImage=splitImage.rightImage( 1+halfRow/4 : 3*halfRow/4 , : );   

    % Remove background noise, otherwise intensity differences cause the
    % picture to be biased.
    
     output.croppedImage=RollingBallFilter(output.croppedImage,30);
     filteredImage=RollingBallFilter(output.laserImages{2}.cam1,30);
    
    % Perform the Correlation
    
    output.correlation=xcorr2( filteredImage , output.croppedImage );
   
    % Find the index of maximum correlation
    
    [maxValue , output.maxIndex]=max(output.correlation(:));
    [output.rowIndex, output.colIndex] = ind2sub(size(output.correlation),output.maxIndex);  
    rowCorrection=output.rowIndex-(config.pixels/2+halfRow/4);    % substract config.pixels for the correlation and halfRow/4 for half or the cropped image size
    colCorrection=output.colIndex-(config.pixels/2+halfCol/2);    % substract config.pixels for the correlation and halfCol/2 for half or the cropped image size
    
   % Perform the correction
    
    output.rightImageCorrected=zeros(size(output.laserImages{2}.cam1));
    for i=1:halfCol
        for j=1:halfRow
            if (j+rowCorrection > 0 && j+rowCorrection<=config.pixels)
                output.rightImageCorrected( j+rowCorrection ,i+colCorrection+config.pixels/4)=(splitImage.rightImage(j,i));
            end
        end
    end

    
    % Visualisation of the correlation
    
    avgRight=sum(splitImage.rightImage(:))/(halfRow*halfCol);
    avgCam1=sum(output.laserImages{2}.cam1(:))/(config.pixels^2);
    scaleFactor=avgCam1/avgRight;
  
    figure;
    blockSize=config.checkerBoardSizeCamera;           % blocksize for the checkerboard pattern
    
    CompareSplit( scaleFactor*output.rightImageCorrected , output.laserImages{2}.cam1 , blockSize) ; title('Correlated Images from Cam0 and Cam1')

end

