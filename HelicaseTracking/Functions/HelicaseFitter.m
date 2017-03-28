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
    
    for i=1:N
        helicaseFitter.brightFinder=BrightFinder( config, simulateImages.simulateHelicases.image{i} );
        helicaseFitter.A(:,:,i)= single(helicaseFitter.brightFinder.matrix);
    end

    
    PSFsigma=config.sigma;     %PSF sigma in pixels
    fittype=1;
    iterations=5;
    
    %   Fit and calculate speed
    
    [P , CRLB , LL , t]=gaussmlev2(helicaseFitter.A , PSFsigma, iterations, fittype);
    
    helicaseFitter.gaussmlev.P=P;
    helicaseFitter.gaussmlev.CRLB=CRLB;
    helicaseFitter.gaussmlev.LL=LL;
    helicaseFitter.gaussmlev.t=t;
    
end

