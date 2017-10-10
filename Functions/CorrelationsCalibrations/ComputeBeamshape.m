function [ output ] = ComputeBeamshape( inputImage )
    % Compute Beamshape - Computes a beamshape profile based on a
    % calibration image
    %   Detailed explanation goes here

    maxValue = max( inputImage(:));
    minValue = min( inputImage(:));
    beamshape = maxValue./inputImage;
    
    output = beamshape;

end

