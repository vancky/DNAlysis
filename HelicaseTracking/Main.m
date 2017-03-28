clear all; clc; close all;

config=struct();
config=Config(config);

%%
numSimulations=36;

for i=1:numSimulations
    %% Simulate a set of images
    fprintf('Running simulations %d/%d.\n',i , numSimulations)
    config.scaleValue=4+i;
    simulateImages=SimulateImages(config);
    

    %% Track the Helicases

        % Tracks helicases along different images
        % 1. For each individual image fit the helicases as Gaussians
        % 3. Make a big matrix with position of each individual helicase over time
        % 4. Obtain valuable information, such as velocity

    helicaseFitter=HelicaseFitter(config, simulateImages);

    %% Analysis

    analysis{i}=Analysis(config, simulateImages, helicaseFitter);
    
    avg(i)=mean(analysis{i}.errorMeters(:,3));
    maximum(i)=max(analysis{i}.errorMeters(:,3));
end
 
%% Visualisation

Visualisation(config,simulateImages , helicaseFitter, analysis, avg , maximum);