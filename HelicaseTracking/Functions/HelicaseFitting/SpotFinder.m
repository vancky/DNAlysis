function [ output ] = SpotFinder( config , inputImage )
    % Spot Finder - finds fluorescent spots in an image.
    % Gives as output the number of spots
  
    watershedImage = WatershedImage( inputImage );
    
    figure;
    subplot(1,2,1); imshow( inputImage , [0 50]); title('Helicase Image'); colorbar
    subplot(1,2,2); imshow( watershedImage , [0 50]); title('Watershed Helicase Image'); colorbar
    
    %%
   
    binaryImage = watershedImage >0;
       
    % Then, find grouped pixels (helicases) based on connected region analysis
    %   bwconncomp finds groups of connected pixels
    %   regionprops finds the area and eccentricity of these groups
    %   We assume DNA has a minimum area and eccentricity
    
    cc = bwconncomp(binaryImage); 
    stats = regionprops(cc, 'Area' , 'Eccentricity' , 'Centroid', 'EquivDiameter');  % note different camelcasing due to matlab settings
        
    idx = find( [stats.Area] > config.areaThreshold ); 
    filteredCc = ismember(labelmatrix(cc), idx);
    filteredStats = regionprops(filteredCc, 'Area' , 'Eccentricity' , 'Centroid', 'EquivDiameter'); 
    numRegions = length(filteredStats);

    for i=1:numRegions
        diameters(i) = filteredStats(i).EquivDiameter;
        circle(i).radii = diameters(i)/2;
        circle(i).centers = filteredStats(i).Centroid;
    end
    
    figure;
    hold on
    imshow( inputImage , [0 50]); colorbar
    for i=1:numRegions
        viscircles( circle(i).centers , circle(i).radii );
    end
    hold off
      
    output.circle = circle;
    output.stats = stats;
    output.filteredStats = filteredStats;

end

