clear all; clc; close all;

config=struct();
config=Config(config);

%% Import Images
fprintf('Importing Images.\n')
importImages=ImportImages(config);
importedLaserImages = ImportMultipleImages( config, config.cameraCorrelationCd );
importedNoiseImages = ImportMultipleImages( config, config.noiseCd );
[beamshape, test] =   GenerateBeamshape( config ); 
fprintf('Images Imported.\n')
%% 1. Beamshape Correction

beamshapeCorrection.sum0=BeamshapeCorrection(config, beamshape , importImages.sum0 );
beamshapeCorrection.sum1=BeamshapeCorrection(config, beamshape , importImages.sum1 );

%filterImages=FilterImages(config, beamshapeCorrection.image);

%% 2. Split Image Correlation (cam0)

splitCorrelation=SplitCorrelation(config, beamshapeCorrection.sum0 );
%% import images

%% Cam 0/1 correlation
cameraCorrelation=CameraCorrelation( config, importedLaserImages );
%clear importedImages;