function [ output ] = Analysis( config, inputImages )
    % Analysis - This function performs the analysis

    for ii = 1:config.numFovs
        fprintf('Data analysis progress %i/%i.\n' , ii , config.numFovs)    
        spotFinder{ii}.cam0 = SpotFinder( config , inputImages.cam0{ii});
        spotFinder{ii}.cam1 = SpotFinder( config , inputImages.cam1{ii});
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

