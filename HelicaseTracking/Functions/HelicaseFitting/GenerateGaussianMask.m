function [ output ] = GenerateGaussianMask( config, brightFinder , fitHelicases )
    % GenerateGaussianMask
    % Generates a Gaussian mask based on the fitting parameters.
    % if the fit has failed (can be seen by exitflag) simply replace the
    % patch with background noise (0).
    
    rowIndex = brightFinder.rowIndex;
    colIndex = brightFinder.colIndex;
    fitSize  = config.fitSize; 
    domainSize = brightFinder.imageSize;
    fitParameters(1) = fitHelicases.gaussmlev.p(2)+1;     % X-coordinate +1 to account for the fact that gaussmlev starts at 0
    fitParameters(2) = fitHelicases.gaussmlev.p(1)+1;     % Y-coordinate
    fitParameters(3) = config.sigma;                    % sigma
    fitParameters(4) = fitHelicases.gaussmlev.p(3)/(2*pi*config.sigma^2);           % the max value
    
    % make a big mask to make sure that patches near the edge don't cause trouble
    bigMask = zeros( domainSize(1)+2*fitSize, domainSize(2)+2*fitSize );         % initiate the mask
 
    output.gaussian = GenerateGaussian( config, fitParameters );  % generate the Gaussian mask

    bigMask( rowIndex : rowIndex+2*fitSize , colIndex : colIndex+2*fitSize ) = output.gaussian; % add the Gaussian to the big mask
    
    % now retrieve the correct mask from the big mask
    
    output.mask( 1:domainSize(1) , 1:domainSize(2) )= ...
        bigMask( 1+fitSize : domainSize(1)+fitSize , 1+fitSize : domainSize(2)+fitSize ); 
    output.mask = (output.mask);
    
end

