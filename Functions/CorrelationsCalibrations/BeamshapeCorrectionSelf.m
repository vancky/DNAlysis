function [ output] = BeamshapeCorrectionSelf( inputImage, filterSize )
    % Beamshape Correction Self - Performs beamshape correction using the
    % statistics of the own image. A median filter is applied to smooth out
    % the image, and then the image is beamshape corrected.
    
    filteredImage= medfilt2( inputImage, filterSize, 'symmetric');
    beamshape = ComputeBeamshape(double(filteredImage));
    output = double(inputImage).*beamshape;
end

