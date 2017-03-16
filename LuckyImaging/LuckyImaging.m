clear all; clc; close all

% The Config.m file contains all parameters which you can adjust.
% Please open it and set the correct directories, parameters, etc.
config=struct();            
config=Config(config);
config=ConfigFunction(config);

%% Import Images
loadBeamshape=LoadBeamshape(config);
importImages=ImportImages(config);
config.numStacks=importImages.numFiles/config.stackSize;        % determine the amount of stacks to analyse, has to be an iteger!

%% Stack images and beamshape correction
fprintf('Stack images and correct beamshapes. \n');
stackImages=StackImages(importImages, config);

for i=1:config.numStacks
    beamshapeCorrection.image{i}=BeamshapeCorrection(loadBeamshape.ballFilt,stackImages.image{i});
end
fprintf('End of section. \n');
%%  CLEAN Algorithm and lucky Imaging for each individual image
tic
for i=1:config.numStacks
    fprintf('Applying lucky image for each image. Progress %d/%d.\n', i, config.numStacks);
    clean{i}=CLEAN(beamshapeCorrection.image{i}, config ,i);
end
toc

%% Lucky Algorithm

%  lucky=Lucky(clean, config);

%% Stack all the images


%% Visualization

