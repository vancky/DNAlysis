clear all; clc; close all;

config=struct();
config=ConfigSIMULATIONS(config);



%% Simulate a set of images

simulateImages=SimulateImages(config);
%% Import images
importImages=ImportImages(config);

%%

%filterImages=FilterImages( config , simulateImages );

%% Track the Helicases

helicaseFitter=HelicaseFitterSimulations(config, simulateImages);

%% Analysis

analysis=Analysis(config, simulateImages, helicaseFitter);

fprintf('The bias is %d.\n', analysis.bias)
fprintf('The standard deviation is %d.\n', analysis.std)
fprintf('The SNR is %d.\n', config.snRatio)


%% Visualisation

post.sigma=analysis.std;
post.bias=analysis.bias;

post.biasAvg=mean(post.bias,2);
post.sigmaAvg=mean(post.sigma, 2);

%%
VisualisationSIMULATIONS(config,simulateImages , helicaseFitter, analysis , post);

