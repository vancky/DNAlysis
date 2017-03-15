clear all; clc; close all

% The Config.m file contains all parameters which you can adjust.
% Please open it and set the correct directories, parameters, etc.
config=struct();            
config=Config(config);
config=ConfigFunction(config);

%% Import Images
loadBeamshape=LoadBeamshape(config);
importImages=ImportImages(config);
for i=1:300
    beamshapeCorrection.image{i}=BeamshapeCorrection(loadBeamshape,importImages.image{i});
end
%%  CLEAN Algorithm and lucky Imaging for each individual image
tic
for i=1:1
    clean{i}=CLEAN(beamshapeCorrection.image{i}, config);
    %lucky=Lucky(clean, config);
end
toc

%% Stack all the images


%% Visualization

