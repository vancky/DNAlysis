function [ output ] = FitHelicases( config , brightFinder )
    % Fit Helicases - fits a large array of helicase spots
    
    % stacks the fluorecent spots into one big 3D matrix
    
    PSFsigma = config.sigma;     %PSF sigma in pixels
    fittype = 1;
    iterations = 5;
    spotIndex = [ brightFinder.rowIndex , brightFinder.colIndex ];
    spot = single( brightFinder.matrix );
    
    %   Fit and calculate speed
    
    [P , CRLB , LL , t] = gaussmlev2( spot , PSFsigma, iterations, fittype);
    
    output.gaussmlev.p = P;
    output.gaussmlev.crlb = CRLB;
    output.gaussmlev.logLikelihood = LL;
    output.gaussmlev.t = t;
    
    % compute the fitted locations
    output.fitLocation= spotIndex+output.gaussmlev.p(:,1:2)-config.fitSize; %[Y,X]

end

