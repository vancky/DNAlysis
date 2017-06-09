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

%% Do some pre processing of the data

preProcess = PreProcess( config , importedHelicaseImages{1} , importedDnaImages{1} ); 

%%
%spotFinder = SpotFinder( config , preProcess.helicaseImage );
helicaseIntensity = HelicaseIntensityFinder( spotFinder , preProcess.helicaseImage );

% numSpots = length( spotFindcloser.circle );
% 
% figure;
% plot(numSpots)
% title('Number of spots per minute, washing occurs from frame 20 ')
% xlabel('Time (frames)')
% ylabel('Number of spots')
% grid

%%
%matchDnaHelicase  = MatchDnaHelicase( config, preProcess.originalImage , importedDnaImages{1}  );

