function [ output ] = CorrectCameraImagesNonLinear( config, alignedImages )
    % Align Camera Images Non Linear - Corrects images from cam0 and cam 1
    % which are shifted in a non-linear manner.
    % Detailed explanation goes here
    
    cam0 = alignedImages.cam0;
    cam1 = alignedImages.cam1;
    
    
    
    output.cam0 = cam0;
    output.cam1 = cam1;
end

