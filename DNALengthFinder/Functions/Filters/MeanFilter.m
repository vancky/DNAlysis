function [ meanFilter ] = MeanFilter( inputImage , filterSize )
    %MEANFILTER Summary of this function goes here
    %   Detailed explanation goes here
    filter=fspecial('average', filterSize);
    meanFilter.outputImage= imfilter(inputImage,filter,'replicate');
end

