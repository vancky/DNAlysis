clear all; clc; close all;

config=struct();
config=Config(config);



%% Simulate a set of images

simulateImages=SimulateImages(config);

%%

%filterImages=FilterImages( config , simulateImages );

%% Track the Helicases

helicaseFitter=HelicaseFitter(config, simulateImages);

%% Analysis

analysis{i,k}=Analysis(config, simulateImages, helicaseFitter);

fprintf('The bias is %d.\n', analysis{i}.bias)
fprintf('The standard deviation %d.\n', analysis{i,k}.std)


    %% Visualisation
for k=1:S
     for i=1:N
         post.sigma(i,k)=analysis{i,k}.std;
         post.bias(i,k)=analysis{i,k}.bias;
     end
end
for i=1:N
    post.errorSigma(i)=std(post.sigma(i,:));
    post.errorBias(i)=std(post.bias(i,:));
end
    post.biasAvg=mean(post.bias,2);
    post.sigmaAvg=mean(post.sigma, 2);

save('.\MatFiles\SnrErrorSimulations\pixelation10to100','analysis','post');

%%
Visualisation(config,simulateImages , helicaseFitter, analysis , post);

