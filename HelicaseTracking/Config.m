function [ config ] = Config( config )
    %CONFIG Summary of this function goes here
    %   Detailed explanation goes here
    
    % Set the Matlab directory
    config.matlabCd=('H:\git\DNAlysis\HelicaseTracking');
    
    
    % Set the parameters
    
    config.pixels= 512;                     % Pixels per image
    config.imageSize=40e-6;                 % Size of the image in m
    config.exposureTime=5e-2;               % Exposure time in seconds    
    config.dataType=('uint16');             % The data type of the images
    
    config.helicaseVelocity=(340e-9)/60;    % Velocity in m/s (based on kB/min)
    config.helicase=[0.5 , 50];             % Input for gaussian simulation, [size in pix,  sigma, scaleValue]
    config.numFrames=100;                   % Number of frames used in the simulation
    config.numHelicases=1;                 % Number of helicases to simulate
    
    % Make sure we can use the functions
    addpath ./Functions
    addpath ./Functions/SimulateData
    addpath ./Functions/Util
end

