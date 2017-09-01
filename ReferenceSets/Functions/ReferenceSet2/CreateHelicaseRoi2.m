function [ output ] = CreateHelicaseRoi2( config, helicaseImages)
    % Create Helicase Region of Interest 1 
    
    numImages = length(helicaseImages);
    
    for i = 1:numImages
        smoothedImage{i}= BallSmooth( helicaseImages{i} ,config.smoothRadius2);
        binaryImage{i} = smoothedImage{i};
        binaryImage{i}( binaryImage{i}< config.helicaseThreshold2) = 0;
        binaryImage{i}( binaryImage{i}> 0) = 1;
    end
    
    output = binaryImage;
end

