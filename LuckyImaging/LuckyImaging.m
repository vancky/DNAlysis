clear all; clc; close all

% The Config.m file contains all parameters which you can adjust.
% Please open it and set the correct directories, parameters, etc.
config=struct();            
config=Config(config);
config=ConfigFunction(config);

%% Import Images
loadBeamshape=LoadBeamshape(config);
importImages=ImportImages(config);

%% Stack images and beamshape correction

stackImages=StackImages(importImages, config);

for i=1:10
    beamshapeCorrection.image{i}=BeamshapeCorrection(loadBeamshape.ballFilt,stackImages.image{i});
end
%%  CLEAN Algorithm and lucky Imaging for each individual image
tic
for i=1:2
    clean{i}=CLEAN(beamshapeCorrection.image{i}, config ,i);
end
toc

%% Lucky Algorithm

tic
 lucky=Lucky(clean, config);
toc

%% Stack all the images


%% Visualization

