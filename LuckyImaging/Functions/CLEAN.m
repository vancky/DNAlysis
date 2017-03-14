function [ clean] = CLEAN( image, config )
    % CLEAN Algorithm
    % 1. Find brightest pixel in each image, extract nearby patch
    % 2. Fit 2D Gaussian to the patch
    % 3. Generate Gaussian mask from fitting parameters and substract from
    %    original image (IF fit has failed replace with background intensity)
    % 4. Repeat 1-3 until a treshold is reached
    
    clean.brightFinder=BrightFinder(image, config);
    clean.fitGaussian=FitGaussian( config , clean.brightFinder.matrix);

end

