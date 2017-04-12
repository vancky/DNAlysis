clear all; clc; close all;
split
config=struct();
config=Config(config);

%% Import Images
fprintf('Importing Images.\n')
importedSplitCorrelationImages=     ImportOneCamera( config.splitCorrelationCd );
importedCameraCorrelationImages =   ImportTwoCameras( config.cameraCorrelationCd );
importedNoiseImages =               ImportTwoCameras( config.noiseCd );
importedBeamshapeImages =           ImportTwoCameras( config.beamshapeCd);

%% Import the helicase and DNA images
importedDnaImages =      ImportOneCamera( config.dnaCd );
importedHelicaseImages = ImportOneCamera( config.helicaseCd );

fprintf('Images Imported.\n')
%% 1. Beamshape Correction

[beamshape , beamshape.test] = generateBeamshape( config, importedBeamshapeImages{1} ); 

%%
beamshapeCorrection.cam0=BeamshapeCorrection(config, beamshape.cam0 , importedSplitCorrelationImages{1} );

%beamshapeCorrection.cam1=BeamshapeCorrection(config, beamshape.cam1 , importedSplitCorrelationImages{1}.cam1 );
%filterImages=FilterImages(config, beamshapeCorrection.image);

%% 2. Split Image Correlation (cam0)

splitCorrelation=SplitCorrelation(config, beamshapeCorrection.cam0 );

%% Cam 0/1 correlation
cameraCorrelation=CameraCorrelation( config, importedCameraCorrelationImages );

%% Match the helicases with DNA

matchDnaHelicase=MatchDnaHelicase( config, splitCorrelation , importedHelicaseImages{1} , importedDnaImages{1} , beamshape );

