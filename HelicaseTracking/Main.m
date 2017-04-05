clear all; clc; close all;

config=struct();
config=Config(config);

S=30; %Total number of simulations

for k=1:S
    fprintf('Overall Simulation %d/%d.\n',k,S)
    N=29; % amount of SNR points
    for i=1:N
        %% Simulate a set of images
        fprintf('Simulation progress %d/%d.\n',i,N)
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

        analysis{i,k}=Analysis(config, simulateImages, helicaseFitter);

        fprintf('The bias is %d.\n', analysis{i}.bias)
        fprintf('The standard deviation %d.\n', analysis{i,k}.std)
    end
end

    %% Visualisation
for k=1:S
     for i=1:N
         post.sigma(i,k)=analysis{i,k}.std;
         post.bias(i,k)=analysis{i,k}.bias;
     end
end
for i=1:N
    post.errorSigma(i)=std(post.sigma(i,:));
    post.errorBias(i)=std(po  st.bias(i,:));
end
    post.biasAvg=mean(post.bias,2);
    post.sigmaAvg=mean(post.sigma, 2);
    post.snRatio=snRatio;
save('.\MatFiles\SnrErrorSimulations\Snr2to30','analysis','post');
%%
Visualisation(config,simulateImages , helicaseFitter, analysis , post);

