function [ outputImage ] = WatershedImage( inputImage )
    % HelicaseWatershed - Give as input an image, this function will find
    % the watershed lines distinguishing different local maxima in the
    % picture and will set these lines to 0 in the original image

    invertImage = abs(inputImage - max(inputImage(:)));
    watershedImage = watershed(invertImage);
    binary = watershedImage>0;
    outputImage= inputImage.*binary; 
end

