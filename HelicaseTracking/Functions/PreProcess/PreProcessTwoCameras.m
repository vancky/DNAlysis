function [ output ] = PreProcessTwoCameras( config, cam0, cam1 )
    % Pre Process Two Cameras - Performs pre processing when using data
    % from multiple cameras
    % Detailed explanation goes here

    alignedImages = AlignCameraImages( config, cam0, cam1);
    alignedImagesNonLinear = CorrectCameraImagesNonLinear( config, alignedImages) ;
    output = alignedImages;
    % output = alignedImagesNonLinear;
end

