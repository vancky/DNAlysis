function [ output ] = FindRoiCenters2( binaryImages, helicaseImages )
    % Find roi centers - Finds the center of a binary picture with
    % identified region of interests
    % Use connected pixel analysis to find the centroids.
    
    numImages = length( binaryImages);
    for i = 1:numImages
        cc = bwconncomp( binaryImages{i}); 
        stats = regionprops( cc, 'Centroid');    
        
        stats2 = regionprops( cc , helicaseImages{i}, 'WeightedCentroid');
        vertcat( stats.Centroid) - vertcat( stats2.WeightedCentroid);
        
        output{i} = vertcat( stats.Centroid);
    end
end

