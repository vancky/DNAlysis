function [ output ] = FilterImages( config, inputImage, threshold )
    % Filter Images - Filters the images after beamshape correction.
    % Step 1: remove the lowst intensity value
    % Step 2: Rescale
    
    
    sortedImage=sort(inputImage(:));
    figure;
    plot(1:length(sortedImage), sortedImage);
       
    % Write the threshold function here
    % 1. make richtlijnen at starting 20% and top 0.5*max-max
    % 2. find smallest distance of that point to the graph
    % 3. that is the threshold
    
    output=inputImage;
    output(output<threshold)=0;
    
    
    
end

