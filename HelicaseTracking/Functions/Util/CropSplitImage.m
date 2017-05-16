function [ outputImage ] = CropSplitImage( config , inputImage )
    % Crop Split Image - Crops an image from cam 0 into two images without
    % the black edges 
    % Specify as an input the cropCoordinates (from the GenerateCropCoordinates function)
    % , the inputImage and a custom offset on the coordinates which is used
    % as a safety measure so that we know for sure that no black lines
    % remain. A minumum value of 3 is reccomended.
    
              
    splitInput = SplitImage( inputImage , 1);
    offset=config.cropOffset;
    
    colCropLeft(1) = config.cropCoordinates.left(1) + offset;
    colCropLeft(2) = config.cropCoordinates.left(2) + -offset ;
    colCropRight = colCropLeft + config.splitCorrelation(2); 
    
    rowLength = size(inputImage , 1);
    
    if config.splitCorrelation(1) >= 0
        rowCropLeft(1) = 1;
        rowCropLeft(2) = rowLength - config.splitCorrelation(1);
        rowCropRight(1) =  1 + config.splitCorrelation(1);
        rowCropRight(2) = rowLength;
    else
        rowCropLeft(1) = 1 + abs(config.splitCorrelation(1));
        rowCropLeft(2) = rowLength ;
        rowCropRight(1) = 1;
        rowCropRight(2) = rowLength - abs(config.splitCorrelation(1));
    end
      
    outputImage.leftImage = splitInput.leftImage( rowCropLeft(1):rowCropLeft(2) , colCropLeft(1):colCropLeft(2) );
    outputImage.rightImage = splitInput.rightImage( rowCropRight(1):rowCropRight(2) , colCropRight(1):colCropRight(2) );
    
end

