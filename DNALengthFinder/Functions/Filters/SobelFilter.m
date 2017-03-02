function [ sobelFilter ] = SobelFilter( inputImage)
    %Sobel Filter filters based on derivatives
    %This filter returns an X and Y component and an average of the two
    %Choose the right one according to you preferences
    filterX = fspecial('sobel');
    filterY = filterX';
    sobelFilter.outputImageX= imfilter(inputImage,filterX,'replicate');
    sobelFilter.outputImageY= imfilter(inputImage,filterY,'replicate');    
    sobelFilter.outputImageXY=uint16(sqrt(double(sobelFilter.outputImageX.^2+sobelFilter.outputImageY.^2)));
end

