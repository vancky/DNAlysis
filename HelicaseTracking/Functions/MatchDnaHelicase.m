function [ output ] = MatchDnaHelicase( config, dnaImage , spotFinder )
    %  Helicase Dna Overlay - Stacks two images of Helicases and DNA
    %  Detailed explanation goes here

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
    idx = find(( ( [regionIntensity.MaxIntensity] > meanIntensity) | ([regionDiameter.EquivDiameter] > 1.5*config.diameterThreshold ) )); 
    filteredBinary = ismember(labelmatrix(cc), idx);
    
    output.binaryDna = filteredBinary ;
    % compute the dna Fraction
    output.dnaFraction = sum(filteredBinary(:)) / numel(filteredBinary);
    
    figure;
    subplot(1,4,1); imshow( dnaImage , []) ; title('DNA');
    subplot(1,4,2); imshow( dnaEdgeBinary, []); title('Dna edges');
    subplot(1,4,3); imshow( dnaEdgeClosed, [] ); title('Connected edges')
    subplot(1,4,4); imshow( filteredBinary, [] ); title('Filtered connected edges')

    
    % Perform the actual matching of DNA with Helicases
    
    N = spotFinder.numSpots;
    circle = spotFinder.circle;
    count = 0;
    for i=1:N
        location= round(circle(i).centers); % [X,Y] center of the helicases
        check = filteredBinary (location(2), location(1)); % check whether the helicase is on the DNA (1 is yes 0 no)
        count = count +check;
    end
    match = count/N;
    
    
    output.match = match;
    output.count = count;
    
    figure;
    hold on
    subplot(1,2,1)
    imshow( dnaEdgeClosed );
    for i=1:N
        viscircles( circle(i).centers , circle(i).radii );
    end
    hold off
    title('Binary Dna map with located helicases')

    
    hold on
    subplot(1,2,2)
    imshow( dnaImage, []); colorbar
    for i=1:N
        viscircles( circle(i).centers , circle(i).radii );
    end
    hold off
    title('Dna Image with located helicases')
   
end

