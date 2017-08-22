function [ output ] = CreateHelicaseRoi1( config, helicaseImage )
    % Create Helicase Region of Interest 1 
    
    smoothedImage= BallSmooth( helicaseImage, config.smoothRadius1);
    binaryImage = smoothedImage;
    binaryImage( binaryImage< config.helicaseThreshold1) = 0;
    binaryImage( binaryImage> 0) = 1;
    
    output = binaryImage;
end

