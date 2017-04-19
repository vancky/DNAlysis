function [ output , test ] = Clean( config , inputImage )
    % CLEAN Algorithm
    % 1. Find brightest pixel in each image, extract nearby patch
    % 2. Fit 2D Gaussian to the patch
    % 3. Generate Gaussian mask from fitting parameters and substract from
    %    original image (IF fit has failed replace with background intensity)
    % 4. Repeat 1-3 until a treshold is reached
    
    
    thresholdValue = 180;
    threshold = 2*thresholdValue;
    loopImage=inputImage;
    newImage=0; 
    
    while threshold >= thresholdValue
        % Step 1 find the brightest pixels, extract spots    
        test.brightFinder = BrightFinder( config, loopImage );
        threshold = test.brightFinder.maxValue;                     % update threshold value
    
        % Fit the spot!
      
        test.fitHelicases = FitHelicases( config , test.brightFinder );
    
        test.generateMask = GenerateGaussianMask( config , test.brightFinder , test.fitHelicases );
    

        loopImage=loopImage-test.generateMask.mask;                                                    % step 3
        newImage=newImage+test.generateMask.mask;
    end
    
    output.loopImage=loopImage;
    output.newImage=newImage;

    
    %figure; 
    %subplot(1,2,1); imshow( output.loopImage , [] ); title('Loop Image')
    %subplot(1,2,2); imshow( output.newImage , [] ); title('New Image')
    

end

