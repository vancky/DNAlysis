clear all; clc; close all;

config=struct();
config=Config(config);

%% Simulate a set of images

simulateImages=SimulateImages(config);

%%

%filterImages=FilterImages( config , simulateImages );

%% Track the Helicases

    % Tracks helicases along different images
    % 1. For each individual image fit the helicases as Gaussians
    % 3. Make a big matrix with position of each individual helicase over time
    % 4. Obtain valuable information, such as velocity

helicaseFitter=HelicaseFitter(config, simulateImages);

%% Analysis

analysis=Analysis(config, simulateImages, helicaseFitter);

fprintf('The signal to noise ratio is %d.\n', config.snRatio)
fprintf('The maximum error %d.\n', max(analysis.errorMeters(:,3)))
fprintf('The average error %d.\n', mean(analysis.errorMeters(:,3)))
fprintf('The standard deviation %d.\n', std(analysis.errorMeters(:,3)))
 
%% Visualisation

%Visualisation(config,simulateImages , helicaseFitter, analysis);