function [ output ] = FindRoiCenters( binaryImage )
    % Find roi centers - Finds the center of a binary picture with
    % identified region of interests
    % Use connected pixel analysis to find the centroids.

    
    cc = bwconncomp( binaryImage ); 
    stats = regionprops( cc, 'Eccentricity', 'Centroid', 'EquivDiameter');
    
    output = vertcat( stats.Centroid);
    
end

