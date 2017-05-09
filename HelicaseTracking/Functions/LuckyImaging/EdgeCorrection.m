function [ output ] = EdgeCorrection( config , inputImage )
    %E Summary of this function goes here
    %   Detailed explanation goes here
    
    domainSize = size(inputImage);
    fitSize = config.fitSize;
    averageValue = mean(mean(inputImage));
    
    edgeImage = inputImage;
    edgeImage( 1 : fitSize , :) = averageValue;
    edgeImage( domainSize(1)-fitSize+1: domainSize(1) , :) = averageValue;
    edgeImage( : , 1 : fitSize ) = averageValue;
    edgeImage( : , domainSize(2)-fitSize+1: domainSize(2)) = averageValue;
    
    output = edgeImage;

end

