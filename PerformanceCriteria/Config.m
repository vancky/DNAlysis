function [ config ] = Config( config, user)
    % Config - File where the user can specify his/her preferences

    % Make sure we can use the functions
    addpath( genpath('../Functions') )
    addpath( genpath('./Functions') )
    
    % Get the general configuration files
    config = GeneralConfig( config, user);
    
     % The directory for loading/saving matlab files in your matfiles folder
    config.matFileCd = 'ReferenceSets/ReferenceSets';
    config.matFileCdComplete = sprintf('%s%s', config.matFilePath, config.matFileCd);
        
    % GENERAL SETTINGS
    % Wavelength of the emitted light from the fluorophores
    config.waveLength = 488e-9;                       
    % Sigma of the diffraction limited spot
    config.sigma = config.waveLength/(2*pi*config.pixelSize*sqrt(2*config.numFactor));  
    
    
    % SPOTFINDER OPTIONS
    % Lower bound on the diameter
    config.diameterThreshold = 4;
    % The sigma for smoothing the image with a gaussian before watershedding 
    config.watershedSmooth = 0.5;
    % Eccentricity threshold to filter out very noncircular particles
    config.eccentricityThreshold = 0.9;
    % The sigma for smoothing the image with a gaussian before watershedding 
    config.mexiHatSigma = config.sigma;
    % Size of the patch being extracted for fitting later on
    config.fitSize =  1+ceil(3*config.sigma);    
    
    % DNAFINDER OPTIONS
    % The radius of the disk-shaped element used to close the DNA in the MatchDnaHelicase script
    config.binaryCloseRadius = 4;      
    % Area threshold in pixels for identifying dna
    config.diameterThresholdDna = 4;              




end

