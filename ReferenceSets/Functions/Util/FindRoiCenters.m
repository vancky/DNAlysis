function [ output ] = FindRoiCenters( binaryImages )
    % Find roi centers - Finds the center of a binary picture with
    % identified region of interests
    % Use connected pixel analysis to find the centroids.
    
    numImages = length( binaryImages);
    for i = 1:numImages
        cc = bwconncomp( binaryImages{i}); 
        stats = regionprops( cc, 'Centroid');
        output{i} = vertcat( stats.Centroid);
    end
end

