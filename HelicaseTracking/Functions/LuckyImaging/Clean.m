function [ output ] = Clean( config , inputImage , thresholdValue )
    % CLEAN Algorithm
    % 1. Find brightest pixel in each image, extract nearby patch
    % 2. Fit 2D Gaussian to the patch
    % 3. Generate Gaussian mask from fitting parameters and substract from
    %    original image (IF fit has failed replace with background intensity)
    % 4. Repeat 1-3 until a treshold is reached
    
    averageValue = mean(mean(inputImage));
    threshold = 2*thresholdValue;
    loopImage=inputImage;
    newImage=0; 
    count = 1;
    countBad = 0;
    
    loopImage = EdgeCorrection( config , loopImage ); % set the edges to average value
    
    while (threshold >= thresholdValue) && ( count<1000 )
        % Step 1 find the brightest pixels, extract spots    
        brightFinder = BrightFinder( config, loopImage );
        threshold = brightFinder.maxValue;                     % update threshold value
        
        if count > 1   % extra loop to make sure that the first count works aswell
            if ((brightFinder.rowIndex == output.brightFinder{count-1}.rowIndex) && (brightFinder.colIndex == output.brightFinder{count-1}.colIndex))
                 % disregard the spot

                loopImage = GenerateBackgroundMask( config , brightFinder , averageValue , loopImage);
                countBad = countBad +1;

            else
                    % Fit the spot!

                fitHelicases = FitHelicasesLucky( config ,brightFinder );
                output.crlb( count ,1:4) = fitHelicases.gaussmlev.crlb;
                output.logLikelihood( count ,1) = fitHelicases.gaussmlev.logLikelihood;
                output.brightFinder{count} =  brightFinder;
                output.fitHelicases{count} = fitHelicases;
                generateMask = GenerateGaussianMask( config , brightFinder , fitHelicases );


                loopImage = loopImage-uint16(generateMask.mask);
                loopImage(loopImage<0) = 0;
                newImage = newImage+generateMask.mask;
                count = count+1;
            end
        else
            
            fitHelicases = FitHelicasesLucky( config ,brightFinder );
            output.crlb( count ,1:4) = fitHelicases.gaussmlev.crlb;
            output.logLikelihood( count ,1) = fitHelicases.gaussmlev.logLikelihood;
            output.brightFinder{count} =  brightFinder;
            output.fitHelicases{count} = fitHelicases;
            generateMask = GenerateGaussianMask( config , brightFinder , fitHelicases );


            loopImage = loopImage-uint16(generateMask.mask);
            loopImage(loopImage<0) = 0;
            newImage = newImage+generateMask.mask;
            count = count+1;    
        end
    output.loopImage=loopImage;
    output.newImage=newImage;

end

