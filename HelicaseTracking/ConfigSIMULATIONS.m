function [ config ] = ConfigSIMULATIONS( config )
    % Config - File where the user can specify his/her preferences
        
    % Set the Matlab directory
    config.matlabCd=('D:\jvanderauweraert\git\DNAlysis\HelicaseTracking');
    config.imageCd=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170405_121201\DNAsytox-incubated-N-tirf-06');
    
    % Set the parameters
    
    config.pixels= 512*4;                     % Pixels per image
    config.imageSize=40e-6;                 % Size of the image in m
    config.exposureTime=50e-3;              % Exposure time in seconds (time per frame)   
    config.dataType=('uint16');             % The data type of the images
    
    config.helicaseVelocity=1*(340e-9)/60;    % Velocity in m/s (based on kB/min)
    config.waveLength=600e-9;               % Wavelength of the emitted light from the fluorophores
    config.numFactor=0.25;                  % Numerical factor which determines the width of the PSF
    config.sigma=config.waveLength/(2*pi*sqrt(2*config.numFactor));      %sigma used to generate the Gaussian, no need to edit!
    config.scaleValue= 100;                 % the maximum pixel intensity used for simulating the helicases
    config.fitSize= round(3*config.sigma);                       % Half size  of the patch where we are going to fit Gaussians.
                                             % For instance if the patch is 25x25 choose 12
                                             % A guideline for this is 3*sigma
    
    config.backgroundNoise=20;              %Intensity of background noise
    
    config.totalTime=10;                   % Total time in seconds
    config.numFrames=config.totalTime/config.exposureTime;   % Number of frames used in the simulation
    config.numHelicases=1;                 % Number of helicases to simulate
    
    % No need to edit anything below here!
    config.pixelSize=config.imageSize/config.pixels;                                         % size in meters per pixel
    config.sigma=config.waveLength/(2*pi*config.pixelSize*sqrt(2*config.numFactor));         % sigma used to generate the Gaussian in pixels
    config.snRatio=(config.scaleValue)/sqrt(config.scaleValue+2*config.backgroundNoise);
    
    %config.scaleValue=.5*sn*(sn+sqrt(sn^2+8*config.backgroundNoise));
    %This line is for when we set the SN ratio and want to know the
    %scaleValue
    
    % Make sure we can use the functions
    addpath ./Functions
    addpath ./Functions/SimulateData
    addpath ./Functions/Util
    addpath ./Functions/HelicaseFitting
    addpath(genpath('./Functions/gaussmlev2'))
end

