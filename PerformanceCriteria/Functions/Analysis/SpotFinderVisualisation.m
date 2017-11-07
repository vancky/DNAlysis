function [ ] = SpotFinderVisualisation( inputImage, circle, greyscale )
    % Spot Finder Visualisation - Creates relevant images for the
    % experiments
    %   Detailed explanation goes here
  
    numRegions = length( circle); 
    
    figure;
    subplot(1,2,1)
    imshow( inputImage , greyscale); colorbar
    title('Helicase Image')
    hold on
    subplot(1,2,2)
    imshow( inputImage , greyscale); colorbar
    for i = 1:numRegions
        viscircles( circle(i).centers , circle(i).radii, 'Color', 'w', 'LineWidth', 0.5 );
    end
    hold off
    title('The SpotFinder Algorithm')
    
end

