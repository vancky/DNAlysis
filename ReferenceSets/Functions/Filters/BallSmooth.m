function [ outputImage ] = BallSmooth( inputImage , radius )
    %BALLFILTER Rolling Ball (disk) filter
    %As inputs you give the image to analyse and the radius for the rolling ball filter. 

    filter = fspecial('disk', radius);
    outputImage = imfilter(inputImage, filter, 'replicate');
end

