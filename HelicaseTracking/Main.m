clear all; clc; close all;

config=struct();
config=Config(config);

N=901;
for i=1:N
    %% Simulate a set of images
    fprintf('progress %d/%d.\n',i,N)
    scaleValue=linspace(10,100,N);
    config.scaleValue=scaleValue(i);  %Update the scaleValue  

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
    
    fprintf('The bias is %d.\n', analysis{i}.bias)
    fprintf('The standard deviation %d.\n', analysis{i}.std)
end


%% Visualisation

for i=1:N
    std(i)=analysis{i}.std;
    bias(i)=analysis{i}.bias;
end
Visualisation(config,simulateImages , helicaseFitter, analysis , bias, std, scaleValue);

