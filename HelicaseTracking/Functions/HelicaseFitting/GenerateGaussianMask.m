function [ generateGaussianMask ] = GenerateGaussianMask( config, clean , indexCheck )
    % GenerateGaussianMask
    % Generates a Gaussian mask based on the fitting parameters.
    % if the fit has failed (can be seen by exitflag) simply replace the
    % patch with background noise (0).
    brightFinder=clean.brightFinder;
    fitGaussian=clean.fitGaussian;
    
    rowIndexCheck=indexCheck(1);
    colIndexCheck=indexCheck(2);
    rowIndex=brightFinder.rowIndex;
    colIndex=brightFinder.colIndex;
    halfPatchSize=config.brightFinderSize; 
    domainSize=config.imageSize;
    
    % make a big mask to make sure that patches near the edge don't cause trouble
    bigMask=zeros(domainSize+2*halfPatchSize);         % initiate the mask
    if  rowIndexCheck==rowIndex && colIndex == colIndexCheck      %found spot is the same, reject!
        generateGaussianMask.gaussian = brightFinder.matrix;
    else 
        if fitGaussian.exitflag ==0                     % if the fit has failed, simply set the mask to the patch itself, so that it will be removed.
            generateGaussianMask.gaussian = brightFinder.matrix;
        else
            generateGaussianMask.gaussian=GenerateGaussian(config, fitGaussian.fit);  % generate the Gaussian mask
        end
    end
    bigMask(rowIndex:rowIndex+2*halfPatchSize, colIndex:colIndex+2*halfPatchSize)=generateGaussianMask.gaussian; % add the Gaussian to the big mask
    
    % now retrieve the correct mask from the big mask
    
    generateGaussianMask.mask(1:domainSize , 1:domainSize )=bigMask(1+halfPatchSize:domainSize+halfPatchSize , 1+halfPatchSize:domainSize+halfPatchSize); 
    generateGaussianMask.mask=uint16(generateGaussianMask.mask);
    
end

