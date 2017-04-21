function [ output ] = Clean( config , inputImage , thresholdValue )
    % CLEAN Algorithm
    % 1. Find brightest pixel in each image, extract nearby patch
    % 2. Fit 2D Gaussian to the patch
    % 3. Generate Gaussian mask from fitting parameters and substract from
    %    original image (IF fit has failed replace with background intensity)
    % 4. Repeat 1-3 until a treshold is reached
    
    
    threshold = 2*thresholdValue;
    loopImage=inputImage;
    newImage=0; 
    count = 1;
    
    while (threshold >= thresholdValue) && ( count<1000 )
        % Step 1 find the brightest pixels, extract spots    
        brightFinder = BrightFinder( config, loopImage );
        threshold = brightFinder.maxValue;                     % update threshold value
        
        % Fit the spot!
      
        fitHelicases = FitHelicases( config ,brightFinder );
        output.crlb( count ,1:4) = fitHelicases.gaussmlev.crlb;
        output.logLikelihood( count ,1)   = fitHelicases.gaussmlev.logLikelihood;
        output.brightFinder{count} =  brightFinder;
        output.fitHelicases{count} = fitHelicases;
        generateMask = GenerateGaussianMask( config , brightFinder , fitHelicases );
    

        loopImage=loopImage-uint16(generateMask.mask);
        loopImage(loopImage<0)=0;
        newImage=newImage+generateMask.mask;
        count=count+1;
    end
    
    output.loopImage=loopImage;
    output.newImage=newImage;

    
    %figure; 
    %subplot(1,2,1); imshow( output.loopImage , [] ); title('Loop Image')
    %subplot(1,2,2); imshow( output.newImage , [] ); title('New Image')
    

end

