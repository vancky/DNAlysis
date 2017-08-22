function [ output ] = PreProcessTwoCameras( config, cam0, cam1 )
    % Pre Process Two Cameras - Performs pre processing when using data
    % from multiple cameras
    % Detailed explanation goes here
    
    alignedImages = AlignCameraImages( config, cam0, cam1);
    alignedImagesNonLinear = CorrectCameraImagesNonLinear( config, alignedImages) ;
    
    cropCoordinates = config.cropCoordinatesNonLinear;
    cam0Cropped = CropImage( cropCoordinates, alignedImagesNonLinear.cam0);
    cam1Cropped = CropImage( cropCoordinates, alignedImagesNonLinear.cam1);
    
    output.cam0 = cam0Cropped;
    output.cam1 = cam1Cropped;
end

