function [ outputImage ] = BackgroundFilterNoScale( inputImage )
    % Background Filter - removes the background noise
    % Step 1. Substract the lowest value in the input image
    % Step 2. Rescale back to the input image values
    % NOTE: gives as output class double regardless of input class
       
    inputImage = double(inputImage);
    
    minInput = min(inputImage(:));
    maxInput = max(inputImage(:));
    
    minFilter = inputImage - minInput;
    outputImage = minFilter;
    
end
