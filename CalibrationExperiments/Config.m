function [ config ] = Config( config, user)
    % Config - File where the user can specify his/her preferences

    % Make sure we can use the functions 
    addpath( genpath('../Functions'))
    addpath( genpath('./Functions'))
    
    % Get the general configuration files
    config = GeneralConfig( config, user);
    
    % Specify whether you want to import images from the K drive or load
    % saved images from the MatFileCd
    config.importOption = 'load';
    
    % The directory for loading/saving matlab files in your matfiles folder
    config.matFileCd = 'Calibrations/mcm646';
    config.matFileCd = sprintf('%s%s', config.matFilePath, config.matFileCd);
    
    % Directory to get the images to analyse from
    config.calibrationCd{1} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\171010\C6\FOV1 2*\*image1*');

    % GENERAL SETTINGS
    % Wavelength of the emitted light from the fluorophores
    config.waveLength = 646e-9;                       
    % Sigma of the diffraction limited spot
    config.sigma = config.waveLength/(2*pi*config.pixelSize*sqrt(2*config.numFactor));         
 
    % SPOTFINDER OPTIONS
    % Lower bound on the diameter
    config.diameterThreshold = 7;
    % The sigma for smoothing the image with a gaussian before watershedding 
    config.mexiHatSigma = config.sigma/2;
    % Eccentricity threshold to filter out very noncircular particles
    config.eccentricityThreshold = 0.9;
    % Factor how much larger the intensity of the spots has to be compared 
    % to the mean intensity
    config.meanThreshold = 1.2;
      
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
    

end

