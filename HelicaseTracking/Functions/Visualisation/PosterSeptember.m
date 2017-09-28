function [ output ] = PosterSeptember( config, preProcess, analysis )
    % Poster September - Visualizes results for the september poster
    
    % This section visualizes the gaussian fitting
    
%     xy = analysis.fitHelicases{1}.cam1.fitPosition(160,:)-...
%         analysis.spotFinder{1}.cam1.centersFormatted(160,:)+config.fitSize+1;
%     
%     figure; 
%     imshow(analysis.spotFinder{1}.cam1.spots(:,:,160), [100 300]);
%     hold on
%     plot( xy(1), xy(2), '.r', 'MarkerSize', 10)
%     hold off
   % This section visualizes the helicase DNA colocalization
    
%     for i = 1:8
%         dna = preProcess.oneCamera{i}.dnaImage;
%         helicase = preProcess.oneCamera{i}.helicaseImage;
%         
%         green = GreyscaleToColor( helicase, [5 35], 'green'); 
%         red =  GreyscaleToColor( dna, [700 2400], 'red');
%          
%         figure;
%         image( green+red );
%         axis equal, axis tight
%     end
%     
    
    % This section visualizes the colocalization
    for i = 1:config.numFovs
        matchLocations = analysis.matchHelicases{i}.matchLocations;
        numMatches = size(matchLocations, 1);
        cam0 = preProcess.twoCameras{i}.cam0;
        cam1 = preProcess.twoCameras{i}.cam1;
        
        green = GreyscaleToColor( cam0, [100 120], 'green'); 
        red =  GreyscaleToColor( cam1, [100 250], 'red');
        
        markerSize = 10;
        fontSize = 20;
        figure; 
        subplot(1,3,1); image(green); title('Green channel', 'FontSize', fontSize)
        
        hold on
        for j = 1:numMatches
            plot( matchLocations(j,1), matchLocations(j,2), 'w+', ...
                'MarkerSize', markerSize);
        end
        hold off
        axis equal, axis tight
        
        subplot(1,3,2); image(red); title('Red channel', 'FontSize', fontSize)
        hold on
        for k = 1:numMatches
            plot( matchLocations(k,1), matchLocations(k,2), 'w+', ...
                'MarkerSize', markerSize);
        end
        hold off
        axis equal, axis tight
        
        subplot(1,3,3); image(green+red); title('Overlay', 'FontSize', fontSize)
        hold on
        for l = 1:numMatches
            plot( matchLocations(l,1), matchLocations(l,2), 'w+', ...
                'MarkerSize', markerSize);
        end
        hold off
        axis equal, axis tight
        
        % Creates the annotation
        dim = [ 0.13, 0, 0.5, 0.1]; % x,y,w,h
        str = 'Pixels (78 nm per pixel)';
        annotation('textbox', dim,  'String', str, 'FitBoxToText', 'on', ...
            'BackgroundColor', 'white')
    end
    
    for ii = 2:3
        matchLocations = analysis.matchHelicases{ii}.matchLocations;
        numMatches = size(matchLocations, 1);
        cam0 = preProcess.twoCameras{ii}.cam0;
        cam1 = preProcess.twoCameras{ii}.cam1;
        
        green = GreyscaleToColor( cam0, [100 120], 'green'); 
        red =  GreyscaleToColor( cam1, [100 250], 'red');
        
        markerSize = 10;
        
        figure; image(green);
        hold on
        for j = 1:numMatches
            plot( matchLocations(j,1), matchLocations(j,2), 'w+', ...
                'MarkerSize', markerSize);
        end
        hold off
        axis equal, axis tight
        
        figure; image(red);
        hold on
        for k = 1:numMatches
            plot( matchLocations(k,1), matchLocations(k,2), 'w+', ...
                'MarkerSize', markerSize);
        end
        hold off
        axis equal, axis tight
        
        figure; image(green+red);
        hold on
        for l = 1:numMatches
            plot( matchLocations(l,1), matchLocations(l,2), 'w+', ...
                'MarkerSize', markerSize);
        end
        hold off
        axis equal, axis tight
    end
end

