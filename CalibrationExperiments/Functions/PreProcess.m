function [ config, output ] = PreProcess( config, inputImages )
    %PREPROCESS Summary of this function goes here
    %   Detailed explanation goes here
    
    numInputFrames = size( inputImages, 3);
    
    % The first image is noise, so we start at the second one
    startFrame = 150;
    endFrame = 300;
    % The right part of the image is distorted, so we only use the image up
    % to this pixel
    xCrop = 360;
    
    images = inputImages( :, 1:xCrop, startFrame:endFrame);
    %images = BeamshapeCorrectionSelf( images(), [30 30]);
    
    output = images;
    config.numFrames = size( output, 3);
    
end

