function [ config, output ] = PreProcessMcm( config, inputImages )
    % Pre Process Mcm 
    
    numInputFrames = size( inputImages, 3);

    CropSplitImage( config, inputImage, config.imageDirection)
    
    % The middle images are best for recognizing individual bleaching events
    startFrame = 150;
    endFrame = 400;
    % The right part of the image is distorted, so we only use the image up
    % to this pixel
    xCrop = 360;

    images = inputImages( :, 1:xCrop, startFrame:endFrame);

    output = images;
    config.numFrames = size( output, 3);

end
