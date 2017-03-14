clear all; clc; close all

% The Config.m file contains all parameters which you can adjust.
% Please open it and set the correct directories, parameters, etc.
config=struct();            
config=Config(config);
config=ConfigFunction(config);

%% Import Images

importImages=ImportImages(config);

%%  CLEAN Algorithm and lucky Imaging for each individual image

%for i=1:importImages.numFiles
    clean=CLEAN(importImages.image{1}, config);
    %lucky=Lucky(clean, config);
%end


%% Stack all the images


%% Visualization

