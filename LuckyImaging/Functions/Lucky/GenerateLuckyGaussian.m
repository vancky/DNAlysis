function [ mask ] = GenerateLuckyGaussian( config, gaussian , index )
    % Stack Luckky Gaussian
    % Stacks a gaussian onto an existing image accounting for edge effects

    
    % set the relevant parameters
    halfPatchSize=config.brightFinderSize;  
    domainSize=config.imageSize;
    rowIndex= index(1);
    colIndex= index(2);
    
    
    %Generate a big mask to account for the edges
    bigMask=zeros(domainSize+2*halfPatchSize, config.dataType);   
    % add the Gaussian to the big mask
    bigMask(rowIndex:rowIndex+2*halfPatchSize, colIndex:colIndex+2*halfPatchSize)=gaussian; 
    
    % now retrieve the correct mask from the big mask
    mask(1:domainSize , 1:domainSize )=bigMask(1+halfPatchSize:domainSize+halfPatchSize , 1+halfPatchSize:domainSize+halfPatchSize); 
    %add the mask to the image
 
end

