function [ output] = BeamshapeCorrectionSelf( inputImages, filterSize )
    % Beamshape Correction Self - Performs beamshape correction using the
    % statistics of the own image. A median filter is applied to smooth out
    % the image, and then the image is beamshape corrected.
    
    numImages = size( inputImages, 3);
    
    for ii = 1:numImages
        filteredImage = medfilt2( inputImages(:,:,ii), filterSize, 'symmetric');
        beamshape = ComputeBeamshape(double(filteredImage));
        correctedImage(:,:,ii) = double(inputImages(:,:,ii)).*beamshape;
    end
    
    output = correctedImage;
end

