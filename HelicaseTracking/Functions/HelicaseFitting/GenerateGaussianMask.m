function [ output ] = GenerateGaussianMask( config, brightFinder , fitHelicases )
    % GenerateGaussianMask
    % Generates a Gaussian mask based on the fitting parameters.
    % if the fit has failed (can be seen by exitflag) simply replace the
    % patch with background noise (0).
    
    rowIndex = brightFinder.rowIndex;
    colIndex = brightFinder.colIndex;
    fitSize  = config.fitSize; 
    domainSize = brightFinder.imageSize;
    fitParameters(1:2) = fitHelicases.gaussmlev.P(1:2);
    fitParameters(3) = config.sigma;
    fitParameters(4) = brightFinder.maxValue-fitHelicases.gaussmlev.P(4);
    
    % make a big mask to make sure that patches near the edge don't cause trouble
    bigMask = zeros( domainSize(1)+2*fitSize, domainSize(2)+2*fitSize );         % initiate the mask
 
    output.gaussian = GenerateGaussian( config, fitParameters );  % generate the Gaussian mask

    bigMask( rowIndex : rowIndex+2*fitSize , colIndex : colIndex+2*fitSize ) = output.gaussian; % add the Gaussian to the big mask
    
    % now retrieve the correct mask from the big mask
    
    output.mask( 1:domainSize(1) , 1:domainSize(2) )= ...
        bigMask( 1+fitSize : domainSize(1)+fitSize , 1+fitSize : domainSize(2)+fitSize ); 
    output.mask = uint16(output.mask);
    
end

