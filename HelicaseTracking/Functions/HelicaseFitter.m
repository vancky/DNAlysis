function [ helicaseFitter ] = HelicaseFitter( config, simulateImages )
    %Helicase Fitter: Fits a gaussian for the different helicases
    % We can use the CLEAN algorithm for this purpose,just with a higher threshold :)
        % CLEAN Algorithm
    % 1. Find brightest pixel in each image, extract nearby patch
    % 2. Fit 2D Gaussian to the patch (use gaussMLEv2)
    % 3. Generate Gaussian mask from fitting parameters and substract from
    %    original image (IF fit has failed replace with background intensity)
    % 4. Repeat 1-3 until a treshold is reached

    
    N=config.numFrames;
    
    % stacks the fluorecent spots into one big 3D matrix
    for i=1:N
        brightFinder=BrightFinder( config, simulateImages.noiseImage(:,:,i) );
        helicaseFitter.spots(:,:,i)= single(brightFinder.matrix);
        helicaseFitter.spotIndex(i,:)=[ brightFinder.rowIndex, brightFinder.colIndex ];  % index for the spots [Y,X]
    end

    
    PSFsigma=config.sigma;     %PSF sigma in pixels
    fittype=1;
    iterations=5;
    
    %   Fit and calculate speed
    
    [P , CRLB , LL , t]=gaussmlev2(helicaseFitter.spots , PSFsigma, iterations, fittype);
    
    helicaseFitter.gaussmlev.P=P;
    helicaseFitter.gaussmlev.CRLB=CRLB;
    helicaseFitter.gaussmlev.LL=LL;
    helicaseFitter.gaussmlev.t=t;
    
    % compute the fitted locations
    helicaseFitter.fitLocation= helicaseFitter.spotIndex+helicaseFitter.gaussmlev.P(:,1:2)-config.fitSize;
        
end

