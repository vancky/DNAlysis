function [ output ] = BrightFinder( config, inputImage  )
     % BrightFinder - Finds the brightest spot in an image
     % Finds the brightest spot in an image, then extracts a submatrix 
     % centered around this point from the original image. The size of this
     % submatrix is given by 2*config.brightFinderSize+1, if this parameter
     % is 12 for instance the patch will be 25x25.
     % NOTE: We use a convolution of the fitsize to make sure that at low SNR single
     % poisson background dots will not be mistaken for the gaussian profile.
     
     fitSize = config.fitSize;                        % Half of the total patch
     imageSize = size( inputImage );
     C = 1/(fitSize^2)*ones(fitSize);                 % Matrix for convolution
     imageConv = conv2( single( inputImage ), C , 'same');
     
     
     % obtain the value of the brightest spot and the index
     [ maxValue , maxIndex ] = max(imageConv(:));        
     [ rowIndex , colIndex ] = ind2sub( imageSize , maxIndex);
     output.maxValue = inputImage( rowIndex, colIndex );
     
     % We still have to account for when the spot is near the edges!
     % We do this by setting zero value outside
     
     bigImage=zeros( imageSize(1)+2*fitSize , imageSize(2)+2*fitSize );
     bigImage( fitSize+1 : fitSize+imageSize(1) , fitSize+1 : fitSize+imageSize(2) )= inputImage;
     
     output.matrix = bigImage( rowIndex : rowIndex+2*fitSize , colIndex : colIndex+2*fitSize );
     output.imageSize = imageSize;
     output.rowIndex = rowIndex;
     output.colIndex = colIndex;
end

