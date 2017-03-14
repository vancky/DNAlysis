function [ brightFinder ] = BrightFinder( image , config )
     % BrightFinder - Finds the brightest spot in an image
    
     imageSize=config.imageSize;
     [brightFinder.value,brightFinder.index]=max(image(:));     % obtain the value of the brightest spot and the index
     
     
     rowIndex=mod(brightFinder.index,imageSize);      % find the row of the index
     if rowIndex==0                                             % our numbers range 1-512 so replace 0 by 512
         rowIndex=imageSize;
     end
     colIndex=ceil(brightFinder.index/imageSize);                     % find the column of the index
     
     % We still have to account for when the spot is near the edges! I guess
     % mirroring the 12 nearest data points is the easiest. So create a
     % 536*536 matrix
     
     mirrorImage=MirrorImage(image,imageSize,config.brightFinderSize);
     
     patchSize=config.brightFinderSize;
     brightFinder.matrix=mirrorImage(rowIndex:rowIndex+2*patchSize,colIndex:colIndex+2*patchSize);
    
     

end

