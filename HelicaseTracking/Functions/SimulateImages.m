function [ simulateImages ] = SimulateImages( config )
    % Simulate Images - Simulates a set of images with helicases
    %   Detailed explanation goes here
    
    fprintf('Simulating Helicases.\n')
    simulateImages.simulateHelicases = SimulateHelicases(config);                    %simulate images with the helicases
    fprintf('Helicases simulated.\n')
    
    for i=1:config.numFrames
        fprintf('Adding noise. Progress %d/%d.\n', i, config.numFrames)
        backgroundImage=simulateImages.simulateHelicases.image{i}+config.backgroundNoise;   %Image with constant 
        simulateImages.noiseImage(:,:,i)=imnoise(backgroundImage,'poisson');
    end

end

