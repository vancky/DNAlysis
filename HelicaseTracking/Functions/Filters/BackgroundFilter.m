function [ outputImage ] = BackgroundFilter( inputImage )
    % Background Filter - removes the background noise
    % Step 1. Substract the lowest value in the input image
    % Step 2. Rescale back to the input image values

    minInput=min(inputImage(:));
    maxInput=max(inputImage(:));
    
    minFilter=inputImage - minInput;
    outputImage=(minFilter/max(minFilter(:)))*maxInput;
    
end

