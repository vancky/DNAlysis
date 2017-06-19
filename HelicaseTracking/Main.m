clear all; clc; close all;

config=struct();
config=Config(config);

%% Import Images

fprintf('Importing Images.\n')
importedSplitCorrelationImages=     ImportOneCamera( config.splitCorrelationCd , 'stack' );
importedDnaImages =                 ImportOneCamera( config.dnaCd , 'stack' );
importedHelicaseImages =            ImportOneCamera( config.helicaseCd , 'stack' );
fprintf('Images Imported.\n')
%% Load or save
%load ( config.matFileCd );
save( config.matFileCd , 'importedHelicaseImages' , 'importedDnaImages');

%% Correlations and calibrations

splitCorrelation  = SplitCorrelation( config, importedSplitCorrelationImages{1} );
config.splitCorrelation = [ splitCorrelation.rowCorrection , splitCorrelation.colCorrection ];
config.cropCoordinates = GenerateCropCoordinates( importedSplitCorrelationImages{1},[]);

%%
for ii = 1:config.numFovs
    fprintf('Data analysis progress %i/%i.\n' , ii , config.numFovs )    

    % Do some pre processing of the data
    
    preProcess{ii} = PreProcess( config , importedHelicaseImages{ii} , importedDnaImages{ii} ); 

    % The actual analysis part

    spotFinder{ii} = SpotFinder( config , preProcess{ii}.helicaseImage );
    helicaseIntensity{ii} = HelicaseIntensityFinder( spotFinder{ii} , (preProcess{ii}.helicaseImageNoScale));
    matchDnaHelicase{ii}  = MatchDnaHelicase( config, preProcess{ii}.dnaImage, spotFinder{ii} );

    fprintf('The number of spots is %i.\n' , spotFinder{ii}.numSpots )
    fprintf('The fraction of helicases located on the DNA is %.2f .\n' , matchDnaHelicase{ii}.match)
    fprintf('The DNA fraction is %.2f .\n' , matchDnaHelicase{ii}.dnaFraction )
end

%%
postProcess = PostProcess( config , matchDnaHelicase , helicaseIntensity , spotFinder);
