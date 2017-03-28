clear all; clc; close all;

config=struct();
config=Config(config);

%% Simulate a set of images

simulateImages=SimulateImages(config);


%% Track the Helicases

    % Tracks helicases along different images
    % 1. For each individual image fit the helicases as Gaussians
    % 3. Make a big matrix with position of each individual helicase over time
    % 4. Obtain valuable information, such as velocity

helicaseFitter=HelicaseFitter(config, simulateImages);

%% Analysis

analysis=Analysis(config, simulateImages, helicaseFitter);


 
%% Visualisation

Visualisation(config,simulateImages , helicaseFitter, analysis);