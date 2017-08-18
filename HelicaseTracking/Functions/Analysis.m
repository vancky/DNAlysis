function [ output ] = Analysis( config, preProcess )
    % Analysis - This function performs the analysis
    
    for ii = 1:config.numFovs
        fprintf('Data analysis progress %i/%i.\n' , ii , config.numFovs )    

        spotFinder{ii} = SpotFinder( config , preProcess{ii}.helicaseImage );
        helicaseIntensity{ii} = HelicaseIntensityFinder( spotFinder{ii} , ...
            (preProcess{ii}.helicaseImageNoScale));
        matchDnaHelicase{ii}  = MatchDnaHelicase( config, preProcess{ii}.dnaImage, spotFinder{ii} );
        %dnaCount = CountDna( config , preProcess{ii}.dnaImage , matchDnaHelicase{ii} );

        fprintf('The number of spots is %i.\n' , spotFinder{ii}.numSpots )
        fprintf('The fraction of helicases located on the DNA is %.2f .\n' , matchDnaHelicase{ii}.match)
        fprintf('The DNA fraction is %.2f .\n' , matchDnaHelicase{ii}.dnaFraction )
    end
    
    output.spotFinder = spotFinder;
    output.helicaseIntensity = helicaseIntensity;
    output.matchDnaHelicase = matchDnaHelicase;
    
end

