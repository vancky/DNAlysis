function [ output ] = HelicaseAnalysis( config, helicaseImages )
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
        for jj = 1:numHelicaseImages
            spotFinder = SpotFinder( helicaseImages{jj}, 'fitSize', config.fitSize, 'mexiHatSigma', config.mexiHatSigma, ...
                'diameterThreshold', config.diameterThreshold, ...
                'eccentricityThreshold', config.eccentricityThreshold);
            
            SpotFinderVisualisation( helicaseImages{jj}, spotFinder.circle, []);
            output.helicaseLocation{jj} = spotFinder.centers;
            output.stats{jj} = spotFinder.filteredStats;
        end
    end
    
end

