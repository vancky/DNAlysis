function [ outputImage ] = CropSplitImage( config , inputImage , offset )
    % Crop Split Image - Crops an image from cam 0 into two images without
    % the black edges 
    % Specify as an input the cropCoordinates (from the GenerateCropCoordinates function)
    % , the inputImage and a custom offset on the coordinates which is used
    % as a safety measure so that we know for sure that no black lines
    % remain. A value of 3 is reccomended.
    
    length= size(inputImage , 2);
    
    leftLeft=config.cropCoordinates.left(1)+offset;
    leftRight=config.cropCoordinates.left(2)-offset;
    rightLeft=config.cropCoordinates.right(1)+offset+length/2;
    rightRight=config.cropCoordinates.right(2)-offset+length/2;
    
    outputImage.leftImage=inputImage( : , leftLeft:leftRight );
    outputImage.rightImage=inputImage( : , rightLeft:rightRight );
    
    figure;
    imshow( inputImage , [] );
    figure;
    subplot(1,2,1);  imshow( outputImage.leftImage , [] );
    subplot(1,2,2);  imshow( outputImage.rightImage , [] );
    

end

