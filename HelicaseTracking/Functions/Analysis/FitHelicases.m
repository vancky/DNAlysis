function [ output ] = FitHelicases( inputImage  )
    % Fit Helicases- fits helicases to an input image
    % Detailed explanation goes here
    
    fittype = 1;
    iterations = 5;
    
    spotIndex = [ brightFinder.rowIndex , brightFinder.colIndex ];
    spot = double( brightFinder.matrix );

    
    
%     PSFsigma = config.sigma;     %PSF sigma in pixels
%     [P , CRLB , LL , t] = gaussmlev2( spot , PSFsigma, iterations, fittype);
% 
%     output.fitLocation= spotIndex+P(:,1:2)-config.fitSize; %[Y,X]

end

