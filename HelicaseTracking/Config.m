function [ config ] = Config( config )
    %CONFIG Summary of this function goes here
    %   Detailed explanation goes here
    
    % Set the Matlab directory
    config.matlabCd=('H:\git\DNAlysis\HelicaseTracking');
    
    
    % Set the parameters
    
    config.pixels= 512;                     % Pixels per image
    config.imageSize=40e-6;                 % Size of the image in m
    config.exposureTime=500e-3;              % Exposure time in seconds (time per frame)   
    config.dataType=('uint16');             % The data type of the images
    
    config.helicaseVelocity=(340e-9)/60;    % Velocity in m/s (based on kB/min)
    config.waveLength=600e-9;               % Wavelength of the emitted light from the fluorophores
    config.numFactor=0.25;                  % Numerical factor which determines the width of the PSF
    config.sigma=config.waveLength/(2*pi*sqrt(2*config.numFactor));      %sigma used to generate the Gaussian, no need to edit!
    config.scaleValue= 5;                  % the maximum pixel intensity used for simulating the helicases
    config.fitSize= 5;             % Half size  of the patch where we are going to fit Gaussians.
                                             % For instance if the patch is 25x25 choose 12
    
    
    config.totalTime=50;                   % Total time in seconds
    config.numFrames=config.totalTime/config.exposureTime;   % Number of frames used in the simulation
    config.numHelicases=1;                 % Number of helicases to simulate
    
    % No need to edit anything below here!
    config.pixelSize=config.imageSize/config.pixels;                                         % size in meters per pixel
    config.sigma=config.waveLength/(2*pi*config.pixelSize*sqrt(2*config.numFactor));         % sigma used to generate the Gaussian in pixels
    
    % Make sure we can use the functions
    addpath ./Functions
    addpath ./Functions/SimulateData
    addpath ./Functions/Util
    addpath ./Functions/HelicaseFitting
    addpath(genpath('./Functions/gaussmlev2'))
end

