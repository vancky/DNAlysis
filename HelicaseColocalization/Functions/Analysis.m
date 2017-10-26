function [ output ] = Analysis( config, inputImages )
    % Analysis - This function performs the analysis

    for ii = 1:config.numFovs
        cam0 = inputImages.cam0{ii};
        cam1 = inputImages.cam1{ii};
        
        fprintf('Data analysis progress %i/%i.\n' , ii , config.numFovs)   
        spotFinder{ii}.cam0 = SpotFinder( cam0, ...
                'medianThreshold' , config.medianThreshold.cam0, ...
                'diameterThreshold', config.diameterThreshold.cam0, ...
                'mexiHatSigma', config.mexiHatSigma.cam0, ...
                'eccentricityThreshold', config.eccentricityThreshold, ...
                'fitSize', config.fitSize);
        spotFinder{ii}.cam1 = SpotFinder( cam1, ...
                'medianThreshold' , config.medianThreshold.cam1, ...
                'diameterThreshold', config.diameterThreshold.cam1, ...
                'mexiHatSigma', config.mexiHatSigma.cam1, ...
                'eccentricityThreshold', config.eccentricityThreshold, ...
                'fitSize', config.fitSize);
            
        SpotFinderVisualisation( cam0, spotFinder{ii}.cam0.circle, [3 22])
        SpotFinderVisualisation( spotFinder{ii}.cam0.smoothImage, spotFinder{ii}.cam0.circle, [3 22])
       % SpotFinderVisualisation( cam1, spotFinder{ii}.cam1.circle, [0 150])
        
        fitHelicases{ii}.cam0 = FitHelicases( config, ...
            spotFinder{ii}.cam0.spots, spotFinder{ii}.cam0.centersFormatted);
        fitHelicases{ii}.cam1 = FitHelicases( config, ...
            spotFinder{ii}.cam1.spots, spotFinder{ii}.cam1.centersFormatted);
        matchHelicases{ii} = MatchHelicases( config, ...
            fitHelicases{ii}.cam0.fitPosition, fitHelicases{ii}.cam1.fitPosition);

        fprintf('The number of spots for cam 0 is %i.\n' , spotFinder{ii}.cam0.numSpots)
        fprintf('The number of spots for cam 1 is %i.\n' , spotFinder{ii}.cam1.numSpots)
        fprintf('The fraction of helicases colocalizing is %.2f .\n' , matchHelicases{ii}.matchFraction)
        fprintf('The fraction of helicases colocalizing at random is %.2f .\n' , matchHelicases{ii}.matchFractionRandom)
        output.spotFinder = spotFinder;
        output.fitHelicases = fitHelicases;
        output.matchHelicases = matchHelicases;
    end
            

end

