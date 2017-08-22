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

    % Creates a Spot Image from where we can extract spots
    fitSize = config.fitSize;
    xSizeInput = size( inputImage, 2);
    ySizeInput = size( inputImage, 1);
    xSizeSpot = xSizeInput+2*fitSize;
    ySizeSpot = ySizeInput+2*fitSize;
    spotImage = ones( ySizeSpot, xSizeSpot) * median( inputImage(:) );
    spotImage( fitSize+1: ySizeInput+fitSize, fitSize+1 : xSizeInput+fitSize) = inputImage;
    
    for i = 1:numRegions
        diameters(i) = filteredStats(i).EquivDiameter;
        circle(i).radii = diameters(i)/2;
        circle(i).centers = filteredStats(i).Centroid;  % note this is [ X , Y ]
        
        xSpot = round( circle(i).centers(1));
        ySpot = round( circle(i).centers(2));
        spots(:,:,i) = spotImage( ySpot:(ySpot+2*fitSize) , xSpot : (xSpot+2*fitSize));
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
    output.centersFormatted = vertcat(circle.centers);
    output.stats = stats;
    output.filteredStats = filteredStats;
    output.binary = filteredCc;    
    output.numSpots = numRegions;
    output.spots = spots;
end

