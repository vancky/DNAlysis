function [ config ] = Config( config )
    %CONFIG Summary of this function goes here
    %   Detailed explanation goes here
    
    % Set the Matlab directory
    config.matlabCd=('H:\git\DNAlysis\HelicaseTracking');
    
    
    % Set the paramters
    
    config.helicase=[13 , 7, 7, 0.5 , 50];  % input [helicase size , mu_x, mu_y, sigma, scaleValue]
    
    
    addpath ./Functions
    addpath ./Functions/SimulateData
    addpath ./Functions/Util
end

