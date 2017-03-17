function [ clean] = Clean( image, config ,i )
    % CLEAN Algorithm
    % 1. Find brightest pixel in each image, extract nearby patch
    % 2. Fit 2D Gaussian to the patch
    % 3. Generate Gaussian mask from fitting parameters and substract from
    %    original image (IF fit has failed replace with background intensity)
    % 4. Repeat 1-3 until a treshold is reached

    threshold=2*config.cleanThreshold;
    count=1;
    countAll=1;
    clean.imageGaussian=0;
    indexCheck=[0, 0]; %initialize index check vector
    
    while threshold>=config.cleanThreshold
           
            clean.brightFinder=BrightFinder( image, config );               % step 1
            threshold=clean.brightFinder.value;                             % update treshold value
            
            clean.fitGaussian=FitGaussian( config , clean.brightFinder.matrix, count); % step 2
                %Build the matrix with results [mu_x , mu_y , sigma,
                %scaleValue] of the fitted Gaussians

             clean.generateGaussianMask=GenerateGaussianMask(config, clean , indexCheck); % step 3
             image=image-clean.generateGaussianMask.mask;                                                    % step 3
                
                
            if indexCheck(1)==clean.brightFinder.rowIndex && indexCheck(2)==clean.brightFinder.colIndex
                % if the spot is the same don't update anything
            else
                if  clean.fitGaussian.exitflag ==0    % if the fit has failed don't update outputArray, imageGaussian.

                else
                    clean.outputArray{count}=clean.fitGaussian.fit;                     % update the output values
                    clean.outputArray{count}(1)=clean.outputArray{count}(1)+clean.brightFinder.colIndex-(config.brightFinderSize+1);
                    clean.outputArray{count}(2)=clean.outputArray{count}(2)+clean.brightFinder.rowIndex-(config.brightFinderSize+1);
                    clean.imageGaussian=clean.imageGaussian+clean.generateGaussianMask.mask;         %show output image
                    count=count+1;          % count of all 'good steps'
                    config.initialGuess=clean.fitGaussian.fit;
                    
                    indexCheck=[clean.brightFinder.rowIndex , clean.brightFinder.colIndex];   %update the indexChecker for the mask generation
                    
                end
            end
            countAll=countAll+1;        % count of all steps, including failed fits
    end
    clean.image=image;
    clean.count=count;
    clean.countAll=countAll;
   
end

