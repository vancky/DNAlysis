function [ brightFinder ] = BrightFinder( config, image  )
     % BrightFinder - Finds the brightest spot in an image
     % Finds the brightest spot in an image, then extracts a submatrix 
     % centered around this point from the original image. The size of this
     % submatrix is given by 2*config.brightFinderSize+1, if this parameter
     % is 12 for instance the patch will be 25x25.
    
     imageSize=config.pixels;
     [brightFinder.value,brightFinder.index]=max(image(:));     % obtain the value of the brightest spot and the index
     
     
     rowIndex=mod(brightFinder.index,imageSize);      % find the row of the index
     if rowIndex==0                                             % our numbers range 1-512 so replace 0 by 512
         rowIndex=imageSize;
     end
     colIndex=ceil(brightFinder.index/imageSize);                     % find the column of the index
     
     % We still have to account for when the spot is near the edges!
     % We do this by mirroring the edges with the function MirrorImage
     
     %mirrorImage=MirrorImage(image,imageSize,config.brightFinderSize);
     %____MIRROR IMAGE CAUSES ERRORS!!! NOW WE USE ZERO VALUE OUTSIDE___
     halfPatchSize=config.fitSize;         % actually this is half of the patch size
     domainSize=config.pixels;
     bigImage=zeros(domainSize+2*halfPatchSize);         % initiate the mask
     bigImage( halfPatchSize+1:halfPatchSize+domainSize , halfPatchSize+1:halfPatchSize+domainSize)=image;
     
     brightFinder.matrix=bigImage(rowIndex:rowIndex+2*halfPatchSize,colIndex:colIndex+2*halfPatchSize);
     brightFinder.rowIndex=rowIndex;
     brightFinder.colIndex=colIndex;
end

