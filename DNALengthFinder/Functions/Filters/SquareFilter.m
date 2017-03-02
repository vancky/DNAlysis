function [ squareFilter ] = SquareFilter( inputImage, ballFilterSize )
    %SQUAREFILTER Summary of this function goes here
    %   Detailed explanation goes here
    square=inputImage.^2;
    %squareFilter.meanFilter=BallFilter(square, ballFilterSize);
    %squareFilter.outputImage=uint16(sqrt(double(squareFilter.meanFilter.outputImage)));
    
    squareFilter.gaussianFilter=GaussianFilter(square,11,5,6,3,4,2);
    squareFilter.outputImage=uint16(sqrt(double(squareFilter.gaussianFilter.outputImage)));
end

