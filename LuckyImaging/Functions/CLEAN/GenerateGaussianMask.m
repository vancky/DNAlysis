function [ generateGaussianMask ] = GenerateGaussianMask( config, brightFinder, fitParameters)
    % GENERATEGAUSSIANMASK Summary of this function goes here
    % Detailed explanation goes here
    
    rowIndex=brightFinder.rowIndex;
    colIndex=brightFinder.colIndex;
    halfPatchSize=config.brightFinderSize; 
    domainSize=config.imageSize;
    
    % make a big mask to make sure that patches near the edge don't cause trouble
    bigMask=zeros(domainSize+2*halfPatchSize);         % initiate the mask
    gaussian=GenerateGaussian(config, fitParameters);  % generate the Gaussian mask
    bigMask(rowIndex:rowIndex+2*halfPatchSize, colIndex:colIndex+2*halfPatchSize)=gaussian; % add the Gaussian to the big mask
    
    % now retrieve the correct mask from the big mask
    
    generateGaussianMask.mask(1:domainSize , 1:domainSize )=bigMask(1+halfPatchSize:domainSize+halfPatchSize , 1+halfPatchSize:domainSize+halfPatchSize); 
    
end

