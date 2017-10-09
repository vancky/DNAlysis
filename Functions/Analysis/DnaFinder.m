function [ output ] = DnaFinder( config, dnaImage )
    % Dna Finder - Converts a greyscale dna image to its binary ROI
    
    dnaEdgeBinary = edge( dnaImage , 'canny' );
    radius = config.binaryCloseRadius;
        
    se = strel('disk' , radius );
    dnaEdgeClosed= imclose(dnaEdgeBinary , se );
    
    % Refine the dnaEdge Closed Image
    
    cc = bwconncomp( dnaEdgeClosed );
    regionIntensity = regionprops( cc , dnaImage , 'MaxIntensity');
    regionDiameter = regionprops( cc , 'EquivDiameter');

    M = length(regionIntensity) ;
    intensity = zeros(M,1);
    for i=1: M
        intensity(i,1) = regionIntensity(i).MaxIntensity;
    end

    % Find the Indexes of the real DNA.
    meanIntensity = mean(intensity) ;
    idx = find(( ( [regionIntensity.MaxIntensity] > meanIntensity) | ([regionDiameter.EquivDiameter] > 1.5*config.diameterThresholdDna ) )); 
    filteredBinary = ismember(labelmatrix(cc), idx);
    
    figure;
    subplot(1,4,1); imshow( dnaImage , [400 3000]) ; title('DNA');
    subplot(1,4,2); imshow( dnaEdgeBinary, []); title('Dna edges');
    subplot(1,4,3); imshow( dnaEdgeClosed, [] ); title('Connected edges')
    subplot(1,4,4); imshow( filteredBinary, [] ); title('Filtered connected edges')
    
    output.dnaRoi= filteredBinary ;
    %compute the dna Fraction
    output.dnaFraction = sum(filteredBinary(:)) / numel(filteredBinary);
end

