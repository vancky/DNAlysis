function [ config ] = Config( config, user )
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
    config.matFileCd = 'DnaHelicaseImports/170621_orc';
    config.matFileCd = sprintf('%s%s', config.matFilePath, config.matFileCd);
    
    % Specify the import type here, either 'OneCamera' or 'TwoCameras'
    config.importType = 'TwoCameras';
        
    % In what direction where the images captured? Horizontal or vertical
    config.imageDirection = 'vertical';
    
    % In case of importing from both cam 0 and cam 1 use this part
    config.multiCamCd.cam0{1} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170620_132228\Ch4MIX-DNApostMCMFOV1-AFTERwashingFOV3-488at30mW*\*cam0_235_0*');
    config.multiCamCd.cam1{1} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170620_132228\Ch4MIX-DNApostMCMFOV1-AFTERwashingFOV3-488at30mW*\*cam1_235_0*');
    config.multiCamCd.cam0{2} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170620_132228\Ch4MIX-DNApostMCMFOV1-AFTERwashingFOV4-488at30mW*\*cam0_247_0*');
    config.multiCamCd.cam1{2} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170620_132228\Ch4MIX-DNApostMCMFOV1-AFTERwashingFOV4-488at30mW*\*cam1_247_0*');
    config.multiCamCd.cam0{3} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170620_132228\Ch4MIX-DNApostMCMFOV1-AFTERwashingFOV5-488at30mW*\*cam0_267_0*');
    config.multiCamCd.cam1{3} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170620_132228\Ch4MIX-DNApostMCMFOV1-AFTERwashingFOV5-488at30mW*\*cam1_267_0*');
    config.multiCamCd.cam0{4} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170620_132228\Ch4MIX-DNApostMCMFOV1-AFTERwashingFOV6-488at30mW*\*cam0_279_0*');
    config.multiCamCd.cam1{4} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170620_132228\Ch4MIX-DNApostMCMFOV1-AFTERwashingFOV6-488at30mW*\*cam1_279_0*');
    config.multiCamCd.cam0{5} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170620_132228\Ch4MIX-DNApostMCMFOV1-AFTERwashingFOV7-488at30mW*\*cam0_291_0*');
    config.multiCamCd.cam1{5} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170620_132228\Ch4MIX-DNApostMCMFOV1-AFTERwashingFOV7-488at30mW*\*cam1_291_0*');
    config.multiCamCd.cam0{6} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170620_132228\Ch4MIX-DNApostMCMFOV1-AFTERwashingFOV8-488at50mW*\*cam0_303_0*');
    config.multiCamCd.cam1{6} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170620_132228\Ch4MIX-DNApostMCMFOV1-AFTERwashingFOV8-488at50mW*\*cam1_303_0*');

    % Directories for correcting Data
    config.splitCorrelationCd{1}      = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170424_104237\00-beads-05*\*cam0_015_0*');
    config.dnaCalibrationCd{1}        = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170530_104553\02-Exp13-FOV5-DNA-MCM-reSytox-532*\*cam0_360_0*');    
    config.cameraCorrelationCd.cam0{1}= ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheres48840mW*\*cam0_184_0*');
    config.cameraCorrelationCd.cam1{1}= ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheres48840mW*\*cam1_184_0*');
    config.cameraCorrelationCd.cam0{2}= ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheres53220mW*\*cam0_187_0*');
    config.cameraCorrelationCd.cam1{2}= ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheres53220mW*\*cam1_187_0*');
    config.cameraCorrelationCd.cam0{3}= ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheres64240mW*\*cam0_190_0*');
    config.cameraCorrelationCd.cam1{3}= ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheres64240mW*\*cam1_190_0*');

    % GENERAL SETTINGS
    % Wavelength of the emitted light from the fluorophores
    config.waveLength = 488e-9;                       
    % Sigma of the diffraction limited spot
    config.sigma = config.waveLength/(2*pi*config.pixelSize*sqrt(2*config.numFactor));         
 
    
    % CALIBRATION AND CORRELATION SETTINGS
    
    % The radius of the rolling ball filter used throughout the scripts
    config.rollingBallConstant = 30;      
    % Size for the blocks in the checkerboard pattern used to check if the split correlation works.
    config.checkerBoardSizeSplit=5;                 
    % Size for the blocks in the checkerboard pattern used to check if the camera correlation works.
    config.checkerBoardSizeCamera=3;                
    % Offset used in cropping images
    config.cropOffset=5;                            
    
    
    % SPOTFINDER OPTIONS
    % Lower bound on the diameter
    config.diameterThreshold.cam0 = 7;
    config.diameterThreshold.cam1 = 7;
    % The sigma for smoothing the image with a gaussian before watershedding 
    config.mexiHatSigma.cam0 = config.sigma;
    config.mexiHatSigma.cam1 = config.sigma;
    % Eccentricity threshold to filter out very noncircular particles
    config.eccentricityThreshold = 0.9;
    % Factor how much larger the intensity of the spots has to be compared 
    % to the mean intensity
    config.medianThreshold.cam0 = 1.2;
    config.medianThreshold.cam1 = 1.2;
    
      
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
 
    % COLOCALIZATION ANALYSIS OPTIONS
    % Half of the square size for getting roi statistics.
    config.roiSize = 5;
    % threshold for colocalizating in pixel (i.e. if 2, 2px and below
    % match).
    config.colocalizationMatch = 3;
    
    
    
    
    
    % Region to crop after performing non linear correction 
    % [minX, maxX, minY, maxY] 
    config.cropCoordinatesNonLinear = [37, 245, 5, 470]; 
    
    % Determine reference points from the camera correlation images for the
    % nonlinear transformation. Note that the moving points belong to the 
    % left part of cam0 (green channel) and the fixed points to the cropped
    % image of cam 1 (after applying AlignCameraImages). 
    
    config.movingPoints(1,:) = [218, 83];  config.movingPoints(6,:) = [54, 237];
    config.movingPoints(2,:) = [123, 378];  config.movingPoints(7,:) = [201, 461];
    config.movingPoints(3,:) = [79, 67];  config.movingPoints(8,:) = [153, 61];
    config.movingPoints(4,:) = [199, 210];  config.movingPoints(9,:) = [241, 243];
    config.movingPoints(5,:) = [80, 356];  config.movingPoints(10,:) = [112, 84];
    
    config.fixedPoints(1,:) = [214, 82];  config.fixedPoints(6,:) = [55, 238];
    config.fixedPoints(2,:) = [127, 378];  config.fixedPoints(7,:) = [205, 460];
    config.fixedPoints(3,:) = [77, 69];  config.fixedPoints(8,:) = [150, 62];
    config.fixedPoints(4,:) = [197, 209];  config.fixedPoints(9,:) = [240, 241];
    config.fixedPoints(5,:) = [83, 356];  config.fixedPoints(10,:) = [110, 86];
    
 
end

