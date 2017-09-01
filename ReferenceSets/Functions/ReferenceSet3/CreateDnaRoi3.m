function [ output ] = CreateDnaRoi3( config, dnaImage)
    % Create DNA Region of Interest 3

    output = ThresholdToBinary( dnaImage, config.dnaThreshold3);
end

