function [ output ] = CreateHelicaseRoi3( config, helicaseImage)
  % Create Helicase Region of Interest 3
    
    binaryImage = helicaseImage;
    binaryImage( binaryImage< config.helicaseThreshold3) = 0;
    binaryImage( binaryImage> 0) = 1;
    
    output = binaryImage;
end

