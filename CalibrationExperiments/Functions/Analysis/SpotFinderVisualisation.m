function [ ] = SpotFinderVisualisation( config, inputImage, circle, greyscale )
    % Spot Finder Visualisation - Creates relevant images for the
    % experiments
    
    
    switch config.calibrationExperiment
        case 'mcm'
            subSize = [ 1, 2];
        case 'rpa'
            subSize = [ 2, 1];
    end
    
            numRegions = length( circle); 

            figure;
            subplot( subSize(1), subSize(2), 1)
            imshow( inputImage , greyscale); colorbar
            title('Helicase Image')
            hold on
            subplot( subSize(1), subSize(2), 2)
            imshow( inputImage , greyscale); colorbar
            for i = 1:numRegions
                viscircles( circle(i).centers , circle(i).radii, 'Color', 'w', 'LineWidth', 0.5 );
            end
            hold off
            title('The SpotFinder Algorithm')

end

