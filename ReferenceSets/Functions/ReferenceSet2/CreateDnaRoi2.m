function [ output ] = CreateDnaRoi2( config, dnaImages )
    % Create DNA ROI 2 
    % Detailed explanation goes here

    numImages = length( dnaImages);
    threshold = config.dnaThreshold2;
    
    for i = 1:numImages
        output{i} = ThresholdToBinary( dnaImages{i}, threshold);
    end
    
end

