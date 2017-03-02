function [ ballFilter ] = BallFilter( inputImage , radius )
    %BALLFILTER Rolling Ball (disk) filter
    %As inputs you give the image to analyse and the radius for the rolling ball filter. 

    filter=fspecial('disk', radius);
    ballFilter.outputImage= imfilter(inputImage,filter,'replicate');

end

