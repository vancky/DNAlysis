function [ simulateImages ] = SimulateImages( config )
    % Simulate Images - Simulates a set of images with helicases
    %   Detailed explanation goes here
    
    
    %noise=SimulateNoise();
    
    simulateImages.simulateHelicases = SimulateHelicases(config);
    
    %simulateImages.image=noise+helicases;
end

