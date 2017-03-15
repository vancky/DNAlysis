function [ generateGaussianMask ] = GenerateGaussianMask( config, brightFinder, fitGaussian)
    % GenerateGaussianMask
    % Generates a Gaussian mask based on the fitting parameters.
    % if the fit has failed (can be seen by exitflag) simply replace the
    % patch with background noise (0).
    
    rowIndex=brightFinder.rowIndex;
    colIndex=brightFinder.colIndex;
    halfPatchSize=config.brightFinderSize; 
    domainSize=config.imageSize;
    
    % make a big mask to make sure that patches near the edge don't cause trouble
    bigMask=zeros(domainSize+2*halfPatchSize);         % initiate the mask
    
    if fitGaussian.exitflag ==0                                    % if the fit has failed, simply set the mask to the patch itself, so that it will be removed.
        gaussian = brightFinder.matrix;
    else
        gaussian=GenerateGaussian(config, fitGaussian.fit);  % generate the Gaussian mask
    end
    bigMask(rowIndex:rowIndex+2*halfPatchSize, colIndex:colIndex+2*halfPatchSize)=gaussian; % add the Gaussian to the big mask
    
    % now retrieve the correct mask from the big mask
    
    generateGaussianMask.mask(1:domainSize , 1:domainSize )=bigMask(1+halfPatchSize:domainSize+halfPatchSize , 1+halfPatchSize:domainSize+halfPatchSize); 
    
    
end

