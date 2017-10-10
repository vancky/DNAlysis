function [ output ] = SpotFinder( config , inputImage, varargin )
    % Spot Finder - finds fluorescent spots in an image.
    % Gives as output the number of spots
    
    % Parses the optional input arguments
    p = inputParser;
    addOptional( p, 'diameterThreshold', 0);
    addOptional( p, 'eccentricityThreshold', 1 );
    addOptional( p, 'fitSize', 10);
    parse( p, varargin{:})
    
    % Performs the watershed algorithm
    meanFilteredImage = MeanThreshold( inputImage );
    watershedImage = WatershedImage( inputImage );
    binaryImage = watershedImage > 0;
    
    % Then, find grouped pixels based on connected region analysis.
    % For this, bw bwconncomp finds groups of connected pixels.
    % Then, regionprops finds the area and eccentricity of these groups.
    % The relevant regions are found based on optional filtering criteria.    
    
    cc = bwconncomp(binaryImage); 
    stats = regionprops(cc, 'Eccentricity' , 'Centroid', 'EquivDiameter');
    
    idx = find( [stats.EquivDiameter] > p.Results.diameterThreshold & [stats.Eccentricity]<= p.Results.eccentricityThreshold ); 
    
    filteredCc = ismember(labelmatrix(cc), idx);
    filteredStats = regionprops(filteredCc, 'Area' , 'Eccentricity' , 'Centroid', 'EquivDiameter'); 
    numRegions = length(filteredStats);

    % Creates a Spot Image from where we can extract spots
    fitSize = p.Results.fitSize;
    xSizeInput = size( inputImage, 2);
    ySizeInput = size( inputImage, 1);
    xSizeSpot = xSizeInput+2*fitSize;
    ySizeSpot = ySizeInput+2*fitSize;
    spotImage = ones( ySizeSpot, xSizeSpot) * median( inputImage(:) );
    spotImage( fitSize+1: ySizeInput+fitSize, fitSize+1 : xSizeInput+fitSize) = inputImage;
    helicaseIntensity = [100 150];
    
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
    output.centers = vertcat(circle.centers);
    output.centersFormatted = round(vertcat(circle.centers));
    output.stats = stats;
    output.filteredStats = filteredStats;
    output.binary = filteredCc;    
    output.numSpots = numRegions;
    output.spots = spots;
end