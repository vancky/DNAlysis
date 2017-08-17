clear all; clc; close all;

config=struct();
config=Config(config);

%% Import Images

fprintf('Importing Images.\n')
importedSplitCorrelationImages=   ImportOneCamera( config.splitCorrelationCd , 'stack');
importedHelicaseImages=            ImportOneCamera( config.helicaseCd , 'stack');
importedDnaImages=                 ImportOneCamera( config.dnaCd , 'stack');

fprintf('Images Imported.\n')
%% Load or save and reference sets
%load ( config.matFileCd );
%load( strcat(config.referenceSetCd, 'ReferenceSet3.mat'));

%importedHelicaseImages{1} = referenceSet3.helicaseImage;
%importedDnaImages{1} = referenceSet3.dnaImage;
save( config.matFileCd , 'importedHelicaseImages' , 'importedDnaImages');

%% Correlations and calibrations
fprintf('This section performs the correlations and calibrations.\n')

splitCorrelation = SplitCorrelation( config, importedSplitCorrelationImages{1} );
config.splitCorrelation = [ splitCorrelation.rowCorrection , splitCorrelation.colCorrection ];
config.cropCoordinates = GenerateCropCoordinates( importedSplitCorrelationImages{1},[]);
config.numFovs = length( importedHelicaseImages);

for ii = 1: config.numFovs
    preProcess{ii} = PreProcess( config , importedHelicaseImages{ii} , importedDnaImages{ii} ); 
    %preProcess{ii} = PreProcessReference( importedHelicaseImages{ii} , importedDnaImages{ii}, 'nofilter' ); 
end

%% Analysis
fprintf('This section performs the Analysis.\n')
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

%%
postProcess = PostProcess( config , matchDnaHelicase , helicaseIntensity , spotFinder);


%% Brownian motion

R = 8.314;          % Universal gas constant [J K-1 mol-1]
T = 293;            % temperature in degrees Kelvin [K]
eta = 1.002e-3;     % dynamic viscosity [kg m-1 s-1]
r = 5e-9;           % radius in [m]
N = 6.022e23;       % Avogadros number (mol-1)
t = 1.00;           % exposure time in seconds

x2avg = R*T*t/(3*pi*eta*r*N); 
xtravel = sqrt(x2avg);
xpix = xtravel / (config.pixelSize)



