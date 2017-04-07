clear all; clc; close all;

config=struct();
config=Config(config);

%% Import Images
fprintf('Importing Images.\n')
importImages=ImportImages(config);
fprintf('Images Imported.\n')
%% 1. Beamshape Correction

beamshapeCorrection=BeamshapeCorrection(config, importImages.sum0);
filterImages=FilterImages(config, beamshapeCorrection.image);

%% 2. Split Image Correlation (cam0)

splitCorrelation=SplitCorrelation(config, beamshapeCorrection.image );


%% Cam 0/1 correlation