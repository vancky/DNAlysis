function [ output ] = CreateDnaRoi2( config, dnaImages )
    % Create DNA ROI 2 
    % Detailed explanation goes here
  
    numImages = length(dnaImages);
    closeRadius = config.binaryCloseRadius;

    filterObjects{1} = [ 16];
    filterObjects{2} = [ 2, 6, 10, 11]; 
    filterObjects{3} = [ 4 ,7]; 
    
    for ii = 1:numImages
        dnaImage{ii} = dnaImages{ii};
        dnaEdgeBinary{ii} = edge( dnaImage{ii} , 'canny' );
        %se = strel('disk' , closeRadius );
        se = strel('rectangle', [4,10]);
        b = bwconncomp( dnaEdgeBinary{ii});
        
        for j = 1:length( filterObjects{ii})
            dnaEdgeBinary{ii}( b.PixelIdxList{ filterObjects{ii}(j) }) = 0;
        end
        
        dnaEdgeClosed{ii}= imclose(dnaEdgeBinary{ii} , se );
    
        dnaEdgeFilled{ii} = imfill( dnaEdgeClosed{ii}, 'holes');

        % Refine the dnaEdge Closed Image

        cc = bwconncomp( dnaEdgeFilled{ii} );
        regionIntensity = regionprops( cc , dnaImage{ii} , 'MaxIntensity');
        regionDiameter = regionprops( cc , 'EquivDiameter');

        M = length(regionIntensity) ;
        intensity = zeros(M,1);
        for i = 1:M
            intensity(i,1) = regionIntensity(i).MaxIntensity;
        end

        % Find the Indexes of the real DNA.
        meanIntensity = mean(intensity) ;
        idx = find(( ( [regionIntensity.MaxIntensity] > meanIntensity) | ([regionDiameter.EquivDiameter] > 1.5*config.diameterThreshold ) )); 
        filteredBinary{ii} = ismember(labelmatrix(cc), idx);

        figure;
        subplot(1,4,1); imshow( dnaImage{ii} , [100 1500]) ; title('DNA');
        subplot(1,4,2); imshow( dnaEdgeBinary{ii}, []); title('Dna edges');
        subplot(1,4,3); imshow( dnaEdgeClosed{ii}, [] ); title('Connected edges')
        subplot(1,4,4); imshow( dnaEdgeFilled{ii}, [] ); title('Holes Filled')
        %subplot(1,4,4); imshow( filteredBinary{ii}, [] ); title('Filtered connected edges') 
    end
    
    
    output = filteredBinary;
    
end

