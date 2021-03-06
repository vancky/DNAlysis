function [ output ] = Analysis( config, preProcess )
    % Analysis - This function performs the analysis
    
    switch config.importType
        case 'OneCamera'
            for ii = 1:config.numFovs
                fprintf('Data analysis progress %i/%i.\n' , ii , config.numFovs )    

                spotFinder{ii} = SpotFinder( config , preProcess.oneCamera{ii}.helicaseImage );
                helicaseIntensity{ii} = HelicaseIntensityFinder( spotFinder{ii} , ...
                    (preProcess.oneCamera{ii}.helicaseImageNoScale));
                matchDnaHelicase{ii}  = MatchDnaHelicase( config, preProcess.oneCamera{ii}.dnaImage, spotFinder{ii} );
                %dnaCount = CountDna( config , preProcess.oneCamera{ii}.dnaImage , matchDnaHelicase{ii} );

                fprintf('The number of spots is %i.\n' , spotFinder{ii}.numSpots )
                fprintf('The fraction of helicases located on the DNA is %.2f .\n' , matchDnaHelicase{ii}.match)
                fprintf('The DNA fraction is %.2f .\n' , matchDnaHelicase{ii}.dnaFraction )
                output.spotFinder = spotFinder;
                output.helicaseIntensity = helicaseIntensity;
                output.matchDnaHelicase = matchDnaHelicase;
            end
            
        case 'TwoCameras'
            for ii = 1:config.numFovs
                fprintf('Data analysis progress %i/%i.\n' , ii , config.numFovs)    
                spotFinder{ii}.cam0 = SpotFinder( config , preProcess.twoCameras{ii}.cam0);
                spotFinder{ii}.cam1 = SpotFinder( config , preProcess.twoCameras{ii}.cam1);
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
            
        otherwise
            fprintf('Please specify a correct importType, either ''OneCamera'' or ''TwoCameras''.\n')
    end       
    
end

