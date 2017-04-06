clear all; clc; close all;

config=struct();
config=Config(config);

%% Import Images

importImages=ImportImages(config);

%% 1. Beamshape Correction

beamshapeCorrection=BeamshapeCorrection(config, images);

%% 2. Split Image Correlation (cam0)

splitCorrelation=SplitCorrelation(config);

%% Cam 0/1 correlation