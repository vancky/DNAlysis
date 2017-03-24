function [ config ] = Config( config )
    %CONFIG Summary of this function goes here
    %   Detailed explanation goes here
    
    % Set the Matlab directory
    config.matlabCd=('H:\git\DNAlysis\HelicaseTracking');
    
    
    % Set the parameters
    
    config.pixels= 512;                     % Pixels per image
    config.imageSize=40e-6;                 % Size of the image in m
    config.exposureTime=500e-3;               % Exposure time in seconds (time per frame)   
    config.dataType=('uint16');             % The data type of the images
    
    config.helicaseVelocity=(340e-9)/60;    % Velocity in m/s (based on kB/min)
    config.waveLength=600e-9;               % Wavelength of the emitted light from the fluorophores
    config.numFactor=0.25;                  % Numerical factor which determines the width of the PSF
    config.sigma=config.waveLength/(2*pi*sqrt(2*pi*config.numFactor));      %sigma used to generate the Gaussian, no need to edit!
  
    config.helicase=[0.5 , ))];             % Input for gaussian simulation, [size in pix,  sigma, scaleValue]
    config.totalTime=500;                   % Total time in seconds
    config.numFrames=config.totalTime/config.exposureTime;   % Number of frames used in the simulation
    config.numHelicases=4;                 % Number of helicases to simulate
    
    % Make sure we can use the functions
    addpath ./Functions
    addpath ./Functions/SimulateData
    addpath ./Functions/Util
end

