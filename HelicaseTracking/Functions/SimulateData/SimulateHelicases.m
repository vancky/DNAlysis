function [ helicase ] = SimulateHelicases( config )
    % Simulate Helicases - generate an individual helicase moving along several images
    %   Detailed explanation goes here
    
    helicaseSize=config.helicase(1);            % size of the helicase
    helicaseParameters=config.helicase(2:5);    % other helicase parameters
    
    helicase=GenerateGaussian(helicaseSize, helicaseParameters);

end

