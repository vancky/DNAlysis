function [ outputImage ] = MeanThreshold( inputImage )
    % Global Mean Filter - Uses the global mean of an image as a
    % threshold, values below the mean are set to 0.
    
    threshold = median( inputImage(:) );
    outputImage = inputImage;
    outputImage( inputImage <threshold ) = 0;
end

