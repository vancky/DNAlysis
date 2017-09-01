function [ outputImage] = ThresholdToBinary( inputImage, threshold )
    % Threshold to Binary - Uses a threshold to convert a greyscale image
    % to binary.
    % The formalism is ThresholdToBinary( inputImage, threshold)
    
    filteredImage = inputImage;
    filteredImage( filteredImage < threshold) = 0;
    filteredImage( filteredImage > 0) = 1;
    
    outputImage = filteredImage;

end

