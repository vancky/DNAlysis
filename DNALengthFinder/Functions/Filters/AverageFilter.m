function [ outputImage ] = AverageFilter( inputImage )
    %AVERAGEFILTER Summary of this function goes here
    %   Detailed explanation goes here
    
    average=sum(sum(inputImage,2))/numel(inputImage);
    outputImage= inputImage-(average-1);                        

end

