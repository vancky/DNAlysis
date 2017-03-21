function [ simulateImages ] = SimulateImages( input_args )
    % Simulate Images - Simulates a set of images with helicases
    %   Detailed explanation goes here
    
    
    noise=SimulateNoise();
    helicases=SimulateHelicases();
    
    simulateImages.image=noise+helicases;
end

