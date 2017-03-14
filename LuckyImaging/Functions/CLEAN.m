function [ clean] = CLEAN( image, config )
    % CLEAN Algorithm
    % 1. Find brightest pixel in each image, extract nearby patch
    % 2. Fit 2D Gaussian to the patch
    % 3. Generate Gaussian mask from fitting parameters and substract from
    %    original image (IF fit has failed replace with background intensity)
    % 4. Repeat 1-3 until a treshold is reached
    image=double(image);
    threshold=250;
    count=1;
    
    clean.imageGaussian=0;
    while threshold>=200
           
            clean.brightFinder=BrightFinder( image, config );
            threshold=clean.brightFinder.value;
            clean.fitGaussian=FitGaussian( config , clean.brightFinder.matrix);
            
            %Build the matrix with results [mu_x , mu_y , sigma,
            %scaleValue] of the fitted Gaussians
            clean.outputArray{count}=clean.fitGaussian.fit;
            clean.outputArray{count}(1)=clean.outputArray{count}(1)+clean.brightFinder.colIndex-(config.brightFinderSize+1);
            clean.outputArray{count}(2)=clean.outputArray{count}(2)+clean.brightFinder.rowIndex-(config.brightFinderSize+1);
            
            clean.generateGaussianMask=GenerateGaussianMask(config, clean.brightFinder ,clean.fitGaussian.fit);
            image=image-clean.generateGaussianMask.mask;
            clean.imageGaussian=clean.imageGaussian+clean.generateGaussianMask.mask;
            count=count+1;
    end
    clean.image=image;
   
end

