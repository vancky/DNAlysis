function [ output ] = SpotFinder( config , inputImage )
    % Spot Finder - finds fluorescent spots in an image.
    % Gives as output the number of spots
  
    meanFilteredImage = MeanThreshold( inputImage );
    watershedImage = WatershedImage( inputImage );
    
    %%
   
    binaryImage = watershedImage >0;
        
    %   Then, find grouped pixels (helicases) based on connected region analysis
    %   bwconncomp finds groups of connected pixels
    %   regionprops finds the area and eccentricity of these groups
    %   We assume DNA has a minimum area and eccentricity
    
    cc = bwconncomp(binaryImage); 
    stats = regionprops(cc, 'Eccentricity' , 'Centroid', 'EquivDiameter');  % note different camelcasing due to matlab settings
    
    idx = find( [stats.EquivDiameter] > config.diameterThreshold & [stats.Eccentricity]< config.eccentricityThreshold ); 
    filteredCc = ismember(labelmatrix(cc), idx);
    filteredStats = regionprops(filteredCc, 'Area' , 'Eccentricity' , 'Centroid', 'EquivDiameter'); 
    numRegions = length(filteredStats);

    for i=1:numRegions
        diameters(i) = filteredStats(i).EquivDiameter;
        circle(i).radii = diameters(i)/2;
        circle(i).centers = filteredStats(i).Centroid;  % note this is [ X , Y ]
    end
    
    figure;
    subplot(1,2,1)
    imshow( inputImage , [100 130]); colorbar
    title('Helicase Image')
    hold on
    subplot(1,2,2)
    imshow( inputImage , [100 130]); colorbar
    for i=1:numRegions
        viscircles( circle(i).centers , circle(i).radii );
    end
    title('The SpotFinder Algorithm')
    hold off
      
    output.circle = circle;
    output.stats = stats;
    output.filteredStats = filteredStats;
    output.binary = filteredCc;    
    output.numSpots = numRegions;
end

