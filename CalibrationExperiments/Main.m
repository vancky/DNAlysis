clear all; clc; close all;

% Choose a user, tudelft or home
user = 'tudelft';
config = struct();
config = Config( config, user);

%% Import Images

fprintf('This section imports all the relevant images.\n')
importImages = ImportImages(config);

%% Correlations and Calibrations

fprintf('This section performs the correlations and calibrations.\n')
[ config ] = CorrelationsCalibrations( config, importImages);

%% Pre Processing of relevant Images

fprintf('This section performs the pre processing of the data.\n')
[ config, preProcess] = PreProcess( config, importImages);

%% Analysis

fprintf('This section performs the Analysis.\n')
[ config, analysis] = Analysis( config, preProcess);

%% Post Processing

fprintf('This section performs the Post Processing.\n')

for ll = 1:config.numFovs
    postProcess = PostProcess( config, analysis.stats{ll}, ll);
end