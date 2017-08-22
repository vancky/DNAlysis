function [ output ] = CreateDnaRoi3( config, dnaImage)
    % Create DNA Region of Interest 3

    filteredImage = dnaImage;
    filteredImage( filteredImage< config.dnaThreshold3) = 0;
    filteredImage( filteredImage> 0) = 1;
    
    output = filteredImage;
end

