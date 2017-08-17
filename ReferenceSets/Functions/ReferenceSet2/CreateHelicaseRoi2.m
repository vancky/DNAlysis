function [ output ] = CreateHelicaseRoi2( config, helicaseImage)
    % Create Helicase Region of Interest 1 
    
    numImages = length(helicaseImage);
    
    for i = 1:numImages
        smoothedImage{i}= BallSmooth( helicaseImage{i} ,config.smoothRadius2);
        binaryImage{i} = smoothedImage{i};
        binaryImage{i}( binaryImage{i}< config.helicaseThreshold2) = 0;
        binaryImage{i}( binaryImage{i}> 0) = 1;
    end
    
    output = binaryImage;
end

