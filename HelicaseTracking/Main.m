clear all; clc; close all;

config=struct();
config=Config(config);

%% 1. Beamshape Correction

beamshapeCorrection=BeamshapeCorrection(config, images);

%% 2. Color Correlation (cam0)



%% Cam 0/1 correlation