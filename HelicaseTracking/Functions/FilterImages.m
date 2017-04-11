function [ output ] = FilterImages( config, inputImage )
    % Filter Images - Filters the images after beamshape correction.
    % Step 1: remove the lowst intensity value
    % Step 2: Rescale
    
       
    output.backgroundFilter=BackgroundFilter(inputImage);
    
    
end

