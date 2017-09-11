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
    
    idx = find( [stats.EquivDiameter] > config.diameterThresholdHelicase & [stats.Eccentricity]< config.eccentricityThreshold ); 
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
    helicaseIntensity = [100 300];
    
    for i = 1:numRegions
        diameters(i) = filteredStats(i).EquivDiameter;
        circle(i).radii = diameters(i)/2;
        circle(i).centers = filteredStats(i).Centroid;  % note this is [ X , Y ]
        
        xSpot = round( circle(i).centers(1));
        ySpot = round( circle(i).centers(2));
        spots(:,:,i) = spotImage( ySpot:(ySpot+2*fitSize) , xSpot : (xSpot+2*fitSize));
    end
    
    figure;
    subplot(1,3,1)
    imshow( inputImage , helicaseIntensity); colorbar
    title('Helicase Image')
    hold on
    subplot(1,3,2)
    imshow( inputImage , helicaseIntensity); colorbar
    for i = 1:numRegions
        viscircles( circle(i).centers , circle(i).radii, 'Color', 'w', 'LineWidth', 0.5 );
    end
    hold off
    title('The SpotFinder Algorithm')
    
    subplot(1,3,3)
    imshow( inputImage, helicaseIntensity); colorbar;
    hold on
    for i = 1:numRegions
        x = circle(i).centers(1)-fitSize;
        y = circle(i).centers(2)-fitSize;
        width = 2*fitSize+1;
        pos = [ x, y, width, width];
        rectangle('Position', pos, 'Edgecolor', 'r')
    end
    title('Regions for Helicase Fitting')
    hold off
      
    %% Plot for the poster :)
    
%     figure;
%     imshow( inputImage , helicaseIntensity); colorbar
%     for i = 1:numRegions
%         viscircles( circle(i).centers , circle(i).radii, 'Color', 'w', 'LineWidth', 0.5 );
%     end
%     
%     figure;
%     imshow( inputImage, helicaseIntensity); colorbar;
%     hold on
%     for i = 1:numRegions
%         x = circle(i).centers(1)-fitSize;
%         y = circle(i).centers(2)-fitSize;
%         width = 2*fitSize+1;
%         pos = [ x, y, width, width];
%         rectangle('Position', pos, 'Edgecolor', 'r')
%     end
%     hold off
    
    output.circle = circle;
    output.centersFormatted = round(vertcat(circle.centers));
    output.stats = stats;
    output.filteredStats = filteredStats;
    output.binary = filteredCc;    
    output.numSpots = numRegions;
    output.spots = spots;
end

