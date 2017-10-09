function [ outputImage ] = RollingBallFilter( inputImage , radius )
    % Rolling Ball Filter
    % As inputs you give the image to analyse and the radius for the rolling ball filter. 
    % The filter will substract the average background value over this
    % large disk for every pixel

    filter=fspecial('disk', radius);
    background= imfilter(inputImage,filter,'replicate');
    outputImage=max(inputImage-background,0);
end