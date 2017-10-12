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
            config.saveMatFileCd=('../../../MatFiles/RpaAnalysis/octNovData');
            config.loadMatFileCd=('../../../MatFiles/RpaAnalysis/octNovData');
        case 'home'
            config.matlabCd=('/home/private/thesisCode/DNAlysis/HelicaseTracking');
            config.saveMatFileCd=('../../MatFiles/RpaAnalysis/octNovData');
            config.loadMatFileCd=('../../MatFiles/RpaAnalysis/octNovData');
        otherwise
            fprintf('Please specify a correct user.\n')
    end

    % Set the Matlab directories, note if you want to specify only a
    % certain camera or measurement set use \folder*\*specificextension*
    % For instance for camera 0 with extension 079 Cd=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170407_094257\DNASytox*\*cam0_079*')
    % For camera 1 and 0 with extension 079: Cd=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170407_094257\DNASytox*\*_079*')
    % For all files in the folder Cd=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170407_094257\DNASytox*\**')
    % 
    % Note if there are other images such as cam0_290_stack, simply adjust
    % set cam0_290_0 instead of cam0_290 to make sure you don't import the
    % stack image.
    
    config.importType = 'twoCameras';
    % In case of importing from both cam 0 and cam 1 use this part
    config.multiCamCd.cam0{1} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170919\C1L\Firing 3*\*image0*');
    config.multiCamCd.cam1{1} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170919\C1L\Firing 3*\*image1*');
    config.multiCamCd.cam0{2} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170920\C6L\Firing 3*\*image0*');
    config.multiCamCd.cam1{2} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170920\C6L\Firing 3*\*image1*');
    config.multiCamCd.cam0{3} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\171004\C6\Loading 7*\*image0*');
    config.multiCamCd.cam1{3} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\171004\C6\Loading 7*\*image1*');
    config.multiCamCd.cam0{4} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\171004\c8\ddK 7*\image0*');
    config.multiCamCd.cam1{4} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\171004\c8\ddK 7*\image1*');
%     config.multiCamCd.cam0{5} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170920\C7L 2*\*image0*');
%     config.multiCamCd.cam1{5} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170920\C7L 2*\*image1*');

    % Directories for correcting Data
    config.splitCorrelationCd{1}         = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170424_104237\00-beads-05*\*cam0_015_0*');
    config.dnaCalibrationCd{1}           = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170530_104553\02-Exp13-FOV5-DNA-MCM-reSytox-532*\*cam0_360_0*');    
    config.cameraCorrelationCd.cam0{1}   = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheres48840mW*\*cam0_184_0*');
    config.cameraCorrelationCd.cam1{1}   = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheres48840mW*\*cam1_184_0*');
    config.cameraCorrelationCd.cam0{2}   = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheres53220mW*\*cam0_187_0*');
    config.cameraCorrelationCd.cam1{2}   = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheres53220mW*\*cam1_187_0*');
    config.cameraCorrelationCd.cam0{3}   = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheres64240mW*\*cam0_190_0*');
    config.cameraCorrelationCd.cam1{3}   = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheres64240mW*\*cam1_190_0*');
    config.beamshapeCorrectionCd.cam0{1} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170927\Illumination correction\DyeAf488\TestAF488 5*\*image0*');
    config.beamshapeCorrectionCd.cam1{1} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170927\Illumination correction\DyeAf488\TestAF488 5*\*image1*');

    
    % In what direction where the images captured? Horizontal or vertical
    config.imageDirection = 'horizontal';
    % How much offset do you want when cropping the optosplit images?
    config.cropOffset = 5;
    
    % SPOTFINDER OPTIONS
    % Lower bound on the diameter
    config.diameterThreshold = 6;
    % The sigma for smoothing the image with a gaussian before watershedding 
    config.watershedSmooth = 0.5;
    % Eccentricity threshold to filter out very noncircular particles
    config.eccentricityThreshold = 0.9;
    
    % GENERAL SETTINGS
    % Pixels per image
    config.pixels= 512;                     
    % Size of the image in m
    config.imageSize=40e-6;                 
    % Wavelength of the emitted light from the fluorophores
    config.waveLength = 488e-9;                       
    % Numerical factor which determines the width of the PSF (from literature)
    config.numFactor = 0.25;                          
    % Size in meters per pixel
    config.pixelSize = config.imageSize/config.pixels;                                         
    
    % FITHELICASES OPTIONS
    % Sigma used as an estimation
    config.sigma = config.waveLength/(2*pi*config.pixelSize*sqrt(2*config.numFactor));         
    % Amount of iterations for fitting (usually 5 is enough)
    config.fitIterations = 10;
    % FitType for GaussMLEv2
    config.fitType = 2;
    % Half size  of the patch where we are going to fit Gaussians. For 
    % instance if the patch is 25x25 choose 12. A guideline for this is 3*sigma
    config.fitSize =  1+ceil(3*config.sigma);    
    
    % ANALYSIS OPTIONS
    % Half of the square size for getting roi statistics.
    config.roiSize = 10;
    
    % Make sure we can use the functions
    addpath( genpath('../Functions') )
    addpath( genpath('./Functions') )
end

