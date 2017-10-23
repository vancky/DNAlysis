function [ output ] = HelicaseAnalysis( config, helicaseImages )
    % Helicase Analysis - Analyses the helicase images for the performance
    % criteria

    % Analyse the helicase images
    numHelicaseImages = length( helicaseImages);

    % Make sure that the analysis outputs something in the case that the
    % reference set is empty.
    if numHelicaseImages == 0
        helicaseLocation{1} = [];
        
    % Perform the actual analysis
    else
        for jj = 1:numHelicaseImages
            spotFinder = SpotFinder( config, helicaseImages{jj}, ...
                'diameterThreshold', config.diameterThreshold, ...
                'mexiHatSigma', config.mexiHatSigma, ...
                'eccentricityThreshold', config.eccentricityThreshold, ...
                'fitSize', config.fitSize);
            
            helicaseLocation{jj} = spotFinder.centers;
        end
    end
    
    output = helicaseLocation;
end

