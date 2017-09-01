function [ outputImage ] = CleanImage( inputImage, cr )
    % Clean a Helicase Image using predefined cleaning regions

    % Initialize a cleaned image with background noise
    cleanedImage = ones(size(inputImage))*median(inputImage(:));

    % Manually clean the images  
    numRegions = size(cr,1);
    for i =1:numRegions
        cleanedImage( cr(i,2):cr(i,4), cr(i,1):cr(i,3) ) = ...
            inputImage( cr(i,2):cr(i,4), cr(i,1):cr(i,3) );
    end
    
    outputImage = cleanedImage;
end

