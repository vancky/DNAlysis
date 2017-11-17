function [ output ] = HelicaseAnalysis( config, helicaseImages, ii )
    % Helicase Analysis - Analyses the helicase images for the performance
    % criteria

    % Analyse the helicase images
    numHelicaseImages = length( helicaseImages);

    % Make sure that the analysis outputs something in the case that the
    % reference set is empty.
    if numHelicaseImages == 0
        output.helicaseLocation = {[]};
        output.stats = {[]};

        % Perform the actual analysis
    
    
    else
        for jj = 1: min( numHelicaseImages, 5) %numHelicaseImages
            fprintf('Progress %i/%i.\n', jj, numHelicaseImages)
            helicaseImage = double( helicaseImages{jj});
            spotFinder = SpotFinder( helicaseImage, ...
                'fitSize', config.fitSize, ...
                'mexiHatSigma', config.mexiHatSigma, ...
                'diameterThreshold', config.diameterThreshold(ii), ...
                'eccentricityThreshold', config.eccentricityThreshold, ...;
                'medianThreshold', config.medianThreshold(ii));

            %SpotFinderVisualisation( helicaseImage, spotFinder.circle, []);
            output.helicaseLocation{jj} = spotFinder.centers;
            output.stats{jj} = spotFinder.filteredStats;
        end
    end

end
