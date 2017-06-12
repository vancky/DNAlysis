clear all; clc; close all;

config=struct();
config=Config(config);


%% Import Images

fprintf('Importing Images.\n')
importedSplitCorrelationImages=     ImportOneCamera( config.splitCorrelationCd , 'stack' );
importedDnaImages =                 ImportOneCamera( config.dnaCd , 'stack' );
importedHelicaseImages =            ImportOneCamera( config.helicaseCd , 'stack' );
fprintf('Images Imported.\n')

%% Correlations and calibrations

splitCorrelation  = SplitCorrelation( config, importedSplitCorrelationImages{1} );
config.splitCorrelation = [ splitCorrelation.rowCorrection , splitCorrelation.colCorrection ];
config.cropCoordinates = GenerateCropCoordinates( importedHelicaseImages{1}(:,:,1),[]);

% Do some pre processing of the data

preProcess = PreProcess( config , importedHelicaseImages{1} , importedDnaImages{1} ); 

%% The actual analysis part

spotFinder = SpotFinder( config , preProcess.helicaseImage );
helicaseIntensity = HelicaseIntensityFinder( spotFinder , (preProcess.helicaseImageRaw));
matchDnaHelicase  = MatchDnaHelicase( config, preProcess.dnaImage, spotFinder);

fprintf( 'The number of spots is %i.\n' , spotFinder.numSpots )
fprintf('The fraction of helicases located on the DNA is %.2f .\n' , matchDnaHelicase.match)

