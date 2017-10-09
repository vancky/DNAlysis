function [ outputImage ] = MedianThreshold( inputImage )
    % Global Median Filter - Uses the global median of an image as a
    % threshold, values below the median are set to 0.
    
    threshold = median( inputImage(:) );
    outputImage = inputImage;
    outputImage( inputImage <threshold ) = 0;
end

