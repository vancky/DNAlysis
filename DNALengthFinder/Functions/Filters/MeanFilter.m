function [ outputImage ] = MeanFilter( inputImage , filterSize )
    %MEANFILTER Summary of this function goes here
    %   Detailed explanation goes here
    filter=fspecial('average', filterSize);
    outputImage= imfilter(inputImage,filter,'replicate');
end

