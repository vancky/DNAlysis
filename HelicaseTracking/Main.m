clear all; clc; close all;

config=struct();
config=Config(config);

%% Import Images
fprintf('Importing Images.\n')
importImages=ImportImages(config);
fprintf('Images Imported.\n')
%% 1. Beamshape Correction

beamshapeCorrection.sum0=BeamshapeCorrection(config, importImages.sum0);
beamshapeCorrection.sum1=BeamshapeCorrection(config, importImages.sum1);

%filterImages=FilterImages(config, beamshapeCorrection.image);

%% 2. Split Image Correlation (cam0)

splitCorrelation=SplitCorrelation(config, beamshapeCorrection.sum0 );
%% import images
importedImages = ImportLaserImages(config);
%% Cam 0/1 correlation
cameraCorrelation=CameraCorrelation( config, importedImages );
%clear importedImages;