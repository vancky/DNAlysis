function [ generateLuckyGaussian ] = GenerateLuckyGaussian( config, index ,parameters )
    % GenerateGaussianMask
    % Generates a Gaussian mask based on the fitting parameters.
    % if the fit has failed (can be seen by exitflag) simply replace the
    % patch with background noise (0).
       
    rowIndex=index(1);
    colIndex=index(2);
    halfPatchSize=config.brightFinderSize; 
    domainSize=config.imageSize;
    
    
    % make a big mask to make sure that patches near the edge don't cause trouble
    bigMask=zeros(domainSize+2*halfPatchSize);         % initiate the mask
    gaussian=GenerateGaussian(config, parameters);  % generate the Gaussian mask
    bigMask(rowIndex:rowIndex+2*halfPatchSize , colIndex:colIndex+2*halfPatchSize)=gaussian; % add the Gaussian to the big mask
    
    % now retrieve the correct mask from the big mask
    
    generateLuckyGaussian(1:domainSize , 1:domainSize )=bigMask(1+halfPatchSize:domainSize+halfPatchSize , 1+halfPatchSize:domainSize+halfPatchSize); 
    
end

