function [ output ] = CompareSplit( image1, image2 , blockSize )
    % Compare Split - Compares two images, by displaying half of each image
    % in a checkerboard pattern in one image.
    % The input is CompareSplit( image 1, image 2, blockSize) where
    % blockSize is the size of the squares in the checkerboard.
    % We assume that the images are the same size.
    
    % Display the two images in one image, fully overlapping.

    
    % Make sure that each image gets a checkerboard pattern, so that we can
    % see the differences
    [numRows,numColumns] = size(image1);
    P = ceil(numRows / blockSize);
    Q = ceil(numColumns / blockSize);
    pattern1 = checkerboard(blockSize, P, Q) > 0;
    pattern2 = checkerboard(blockSize, P, Q) < 1;
    pattern1 = pattern1(1:numRows, 1:numColumns);
    pattern2 = pattern2(1:numRows, 1:numColumns);
        
    newImage = pattern1.*image1+pattern2.*image2;
    imshow(newImage, [])

end

