clear all; clc; close all;

config=struct();
config=Config(config);

%% Import Images
fprintf('Importing Images.\n')
importSplitCorrelationImages=ImportMultipleImages( config , config.splitCorrelationCd );
importedCameraCorrelationImages = ImportMultipleImages( config, config.cameraCorrelationCd );
importedNoiseImages = ImportMultipleImages( config, config.noiseCd );
[beamshape.cam0, beamshape.cam0test] =   GenerateBeamshape( config, config.beamshapeDirLabelCam0 ); 
[beamshape.cam1, beamshape.testcam1test] =        GenerateBeamshape( config, config.beamshapeDirLabelCam1 ); 
%% Import the helicase and DNA images
%importedDnaImages=ImportMultipleImages( config , config.dnaCd , 115 );
importedHelicaseImages=ImportMultipleImages( config , config.helicaseCd , 079 );

fprintf('Images Imported.\n')
%% 1. Beamshape Correction

beamshapeCorrection.sum0=BeamshapeCorrection(config, beamshape.cam0 , importSplitCorrelationImages{1}.cam0 );
beamshapeCorrection.sum1=BeamshapeCorrection(config, beamshape.cam1 , importSplitCorrelationImages{1}.cam1 );

%filterImages=FilterImages(config, beamshapeCorrection.image);

%% 2. Split Image Correlation (cam0)

splitCorrelation=SplitCorrelation(config, beamshapeCorrection.sum0 );

%% Cam 0/1 correlation
cameraCorrelation=CameraCorrelation( config, importedCameraCorrelationImages );
%clear importedImages;