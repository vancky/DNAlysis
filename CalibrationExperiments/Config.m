function [ config ] = Config( config, user )
    % Config - File where the user can specify his/her preferences

    
    % Specify whether you want to import images from the K drive or load
    % saved images from the MatFileCd
    config.importOption = 'load';
    
    switch user
        case 'tudelft'                
            config.matlabCd=('D:\jvanderauweraert\git\DNAlysis\HelicaseTracking');
            % The matfile Cd, note that we can load images by specifying the
            % correct .mat file name, if saving, specify the new relevant name
            config.saveMatFileCd=('../../../MatFiles/Calibrations/mcm646');
            config.loadMatFileCd=('../../../MatFiles/Calibrations/mcm646');
        case 'home'
            config.matlabCd=('/home/private/thesisCode/DNAlysis/HelicaseTracking');
            config.saveMatFileCd=('../../MatFiles/Calibrations/mcm646');
            config.loadMatFileCd=('../../MatFiles/Calibrations/mcm646');
        otherwise
            fprintf('Please specify a correct user.\n')
    end
    
    config.calibrationCd{1} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\171010\C6\FOV1 2*\*image1*');

    % GENERAL SETTINGS
    % Pixels per image
    config.pixels= 512;                     
    % Size of the image in m
    config.imageSize=40e-6;                 
    % Wavelength of the emitted light from the fluorophores
    config.waveLength = 646e-9;                       
    % Numerical factor which determines the width of the PSF (from literature)
    config.numFactor = 0.25;                          
    % Size in meters per pixel
    config.pixelSize = config.imageSize/config.pixels;    
    % Sigma of the diffraction limited spot
    config.sigma = config.waveLength/(2*pi*config.pixelSize*sqrt(2*config.numFactor));         
 
    % SPOTFINDER OPTIONS
    % Lower bound on the diameter
    config.diameterThreshold = 7;
    % The sigma for smoothing the image with a gaussian before watershedding 
    config.mexiHatSigma = config.sigma;
    % Eccentricity threshold to filter out very noncircular particles
    config.eccentricityThreshold = 0.9;
      
    % FITHELICASES OPTIONS
    % Sigma used as an estimation
    config.fitSigma = config.sigma;
    % Amount of iterations for fitting (usually 5 is enough)
    config.fitIterations = 10;
    % FitType for GaussMLEv2
    config.fitType = 2;
    % Half size  of the patch where we are going to fit Gaussians. For 
    % instance if the patch is 25x25 choose 12. A guideline for this is 3*sigma
    config.fitSize =  1+ceil(3*config.sigma);    
 
    % ANALYSIS OPTIONS
    % Half of the square size for getting roi statistics.
    config.roiSize = 5;
    
    % Make sure we can use the functions
    addpath( genpath('../Functions') )
    addpath( genpath('./Functions') )
end

