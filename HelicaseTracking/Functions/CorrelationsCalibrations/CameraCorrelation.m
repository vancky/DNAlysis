function [ output ] = CameraCorrelation( config, importedImages )
    % Camera Correlation - Finds the correlation between the different cameras
    % Detailed explanation goes here
    
    % Import the laser images!
    cam0 = importedImages.cam0{1};
    cam1 = importedImages.cam1{3};
    

    % Split the image horizontal and make a crop in the vertical direction
    % to make sure that we can perform proper correlation
    
    splitImage = SplitImage( cam0, 1);
    cam0Crop = splitImage.rightImage;
    halfRow = size( cam0Crop, 1);
    halfCol = size( cam0Crop, 2);
    
    output.croppedImage = splitImage.rightImage( 1+halfRow/4 : 3*halfRow/4, :);   

    % Remove background noise, otherwise intensity differences cause the
    % picture to be biased.
    
    output.croppedImage = RollingBallFilter( output.croppedImage, 30);
    filteredImage = RollingBallFilter( cam1, 30);
    output.filteredImage = filteredImage;
    
    % Perform the Correlation note the order is
    % xcorr2( big image, small image)!!! Not reverse
    
    output.correlation = xcorr2( filteredImage, output.croppedImage );
   
    % Find the index of maximum correlation
    
    [maxValue, output.maxIndex] = max(output.correlation(:));
    [output.rowIndex, output.colIndex] = ind2sub(size(output.correlation), output.maxIndex);  

    % The starting pixels of where we need to crop large image to match
    % small image so we substract these. Also note that the croppedImage
    % misses halfRow/4, so we need to account for this aswell.
    
    rowCorrection = output.rowIndex - size( output.croppedImage , 2) - halfRow/4;
    colCorrection = output.colIndex - size( output.croppedImage , 1);
    output.coordinates = [ rowCorrection, colCorrection];
    
    cam1Crop = zeros( size(cam0Crop));
    
    for i = 1:halfCol
        for j = 1:halfRow
            if (j+rowCorrection > 0 && j+rowCorrection<=halfRow)
                cam1Crop(j,i) = cam1( j+rowCorrection, i+colCorrection);
            end
        end
    end
    
    % Uncomment this section for visualisation of the correlation
    
%     avgCam0 = sum( cam0Crop(:)) / (halfRow*halfCol);
%     avgCam1 = sum( cam1(:)) / (config.pixels^2);
%     scaleFactor = avgCam1/avgCam0;
%     
%     figure;
%     imshow( cam0, []); colorbar; title('Cam0 488mW')
%     figure;
%     imshow( cam1, []); colorbar; title('Cam1 642mW')
%     
%     figure;
%     subplot(1,2,1); imshow( cam0Crop, []); colorbar; title('Cam 0 Aligned')
%     subplot(1,2,2); imshow( cam1Crop, []); colorbar; title('Cam 1 Aligned')
%     
%     figure;
%     blockSize = config.checkerBoardSizeCamera; 
%     CompareSplit( scaleFactor*cam0Crop, cam1Crop, blockSize);
%     title('Correlated Images from Cam0 and Cam1')

end

