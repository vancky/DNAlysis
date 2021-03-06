clear all; clc; close all;

config = struct();
config = Config(config);

%% Import Images

fprintf('This section imports all the relevant images.\n')
importImages = ImportImages(config);

% save( config.saveMatFileCd , 'importImages');
% load ( config.loadMatFileCd );

%% Correlations and calibrations

fprintf('This section performs the correlations and calibrations.\n')
[config, correlationsCalibrations] = CorrelationsCalibrations( config, importImages);

%% Pre Processing of relevant Images

fprintf('This section performs the pre processing of the data.\n')
preProcess = PreProcess( config, importImages);

%% Analysis

fprintf('This section performs the Analysis.\n')
analysis = Analysis( config, preProcess);

%% Post Processing

fprintf('This section performs the post processing.\n')

%postProcess = PostProcess( config , analysis.matchDnaHelicase , analysis.helicaseIntensity , analysis.spotFinder);


%% Visualisations for poster september

PosterSeptember( config, preProcess, analysis )