clear all; clc; close all;

config=struct();
config=Config(config);

N=100;
for i=1:N
    %% Simulate a set of images
    fprintf('progress %d/%d.\n',i,N)
    snRatio=linspace(2,30,N);
    sn=snRatio(i);
    config.scaleValue=.5*sn*(sn+sqrt(sn^2+8*config.backgroundNoise)); %Update the scaleValue
    
    
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

    analysis{i}=Analysis(config, simulateImages, helicaseFitter);
    
    fprintf('The signal to noise ratio is %d.\n', sn)
    fprintf('The average error %d.\n', analysis{i}.bias)
    fprintf('The standard deviation %d.\n', analysis{i}.std)
end

%% Visualisation

for i=1:N
    std(i)=analysis{i}.std;
    bias(i)=analysis{i}.bias;
end
Visualisation(config,simulateImages , helicaseFitter, analysis , snRatio, bias, std);