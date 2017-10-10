function [ output ] = CropSplitCam0( config, inputImage )
    % Crop Split Cam 0 
            
    % Split the beamshape image from cam 0
    splitImage = SplitImage( inputImage, config.imageDirection);
    
    % Crop the beamshape image from cam 0
    xSize = size( inputImage, 2);
    cropCoordinates = [1 , xSize, config.cropCoordinates.bottom ];
    cropCoordinates(3) = cropCoordinates(3) + config.cropOffset;
    cropCoordinates(4) = cropCoordinates(4) - config.cropOffset;
    
    croppedImage = CropImage( cropCoordinates, splitImage.bottomImage);

    output = croppedImage;
end

