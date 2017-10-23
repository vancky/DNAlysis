clear all; close all; clc; 

% Choose a user, tudelft or home
user = 'tudelft';
config = struct();
config = Config( config, user);

%% Import Images

fprintf('This section imports all the relevant images.\n')
[ config, importImages] = ImportImages(config);

%% Analysis

fprintf('This section performs the Analysis.\n')
analysis = Analysis( config, importImages);

%% Post Process

fprintf('This section performs the post processing.\n')
postProcess = PostProcess( config, importImages, analysis);

