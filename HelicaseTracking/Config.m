function [ config ] = Config( config )
    % Config - File where the user can specify his/her preferences
    
    
    % Set the Matlab directories, note if you want to specify only a
    % certain camera or measurement set use \folder*\*specificextension*
    % For instance for camera 0 with extension 079 Cd=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170407_094257\DNASytox*\*cam0_079*')
    % For camera 1 and 0 with extension 079: Cd=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170407_094257\DNASytox*\*_079*')
    % For all files in the folder Cd=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170407_094257\DNASytox*\**')
    % 
    % Note if there are other images such as cam0_290_stack, simply adjust
    % set cam0_290_0 instead of cam0_290 to make sure you don't import the
    % stack image.
    
    config.matlabCd=('D:\jvanderauweraert\git\DNAlysis\HelicaseTracking');
    config.referenceSetCd = ('../../../MatFiles/ReferenceSets/');
    
    % The matfile Cd, note that we can load images by specifying the
    % correct .mat file name, if saving, specify the new relevant name
    config.saveMatFileCd=('../../../MatFiles/DnaHelicaseImports/170621_orc');
    config.loadMatFileCd=('../../../MatFiles/DnaHelicaseImports/170530_orc');
    
    % Specify the import type here, either 'OneCamera' or 'TwoCameras'
    config.importType = 'TwoCameras';
    
    % When only using one camera this is the part to edit.
    
    config.helicaseCd{1}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170620_132228\Ch2-FSpostMCM01preWash*\*cam0_031_0*');
    config.helicaseCd{2}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170531_162419\Exp12-Ch3-FOV4-DNA-MockMCMreSyttox488MCMWashresytox488noflow*\*cam0_381_0*');
    config.helicaseCd{3}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170531_162419\Exp12-Ch3-FOV5-DNA-MockMCMreSyttox488MCMWashresytox488noflow*\*cam0_397_0*');
    config.helicaseCd{4}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170531_162419\Exp12-Ch3-FOV6-DNA-MockMCMreSyttox488MCMWashresytox488noflow*\*cam0_413_0*');
    config.helicaseCd{5}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170531_162419\Exp12-Ch3-FOV7-DNA-MockMCMreSyttox488MCMWashresytox488noflow*\*cam0_429_0*');
    config.helicaseCd{6}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170531_162419\Exp12-Ch3-FOV8-DNA-MockMCMreSyttox488MCMWashresytox488noflow*\*cam0_445_0*');
    config.helicaseCd{7}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170531_162419\09-C11-FOV7-488*\*cam0_134_0*');
    config.helicaseCd{8}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170531_162419\09-C11-FOV8-488*\*cam0_150_0*');
    config.helicaseCd{9}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170531_162419\09-C11-FOV9-488*\*cam0_168_0*');
    config.helicaseCd{10}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170531_162419\09-C11-FOV10-488*\*cam0_184_0*');
    
    config.dnaCd{1}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170531_162419\Exp12-Ch3-FOV3-DNA-MockMCMreSyttox488MCMWashresytox532noflow*\*cam0_365_0*');
    config.dnaCd{2}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170531_162419\Exp12-Ch3-FOV4-DNA-MockMCMreSyttox488MCMWashresytox532noflow*\*cam0_385_0*');
    config.dnaCd{3}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170531_162419\Exp12-Ch3-FOV5-DNA-MockMCMreSyttox488MCMWashresytox532noflow*\*cam0_401_0*');
    config.dnaCd{4}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170531_162419\Exp12-Ch3-FOV6-DNA-MockMCMreSyttox488MCMWashresytox532noflow*\*cam0_417_0*');
    config.dnaCd{5}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170531_162419\Exp12-Ch3-FOV7-DNA-MockMCMreSyttox488MCMWashresytox532noflow*\*cam0_433_0*');
    config.dnaCd{6}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170531_162419\Exp12-Ch3-FOV8-DNA-MockMCMreSyttox488MCMWashresytox532noflow*\*cam0_449_0*');
    config.dnaCd{7}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170531_162419\09-C11-FOV7-532*\*cam0_128_0*');    
    config.dnaCd{8}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170531_162419\09-C11-FOV8-532*\*cam0_144_0*');    
    config.dnaCd{9}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170531_162419\09-C11-FOV9-532*\*cam0_162_0*');    
    config.dnaCd{10}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170531_162419\09-C11-FOV10-532*\*cam0_178_0*');    
    
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

    
    % Set the parameters

    config.pixels= 512;                     % Pixels per image
    config.imageSize=40e-6;                 % Size of the image in m
    config.dataType=('uint16');             % The data type of the images
    config.luckyStackSize = 1;              % Stack size for the lucky algorithm
    config.luckyThreshold = 0.1;            % Best fraction of gaussians allowed by the algorithm (0.2 equals 20%)
    config.rollingBallConstant = 30;        % The radius of the rolling ball filter used throughout the scripts
    config.binaryCloseRadius = 4;           % The radius of the disk-shaped element used to close the DNA in the MatchDnaHelicase script
    
    % threshold for colocalizating in pixel (i.e. if 2, 2px and below
    % match).
    config.colocalizationMatch = 3;
    
    config.diameterThresholdHelicase = 4;              % Area threshold in pixels for identifying helicases
    config.diameterThresholdDna = 4;              % Area threshold in pixels for identifying dna

    config.eccentricityThreshold = 0.9;      % Eccentricity threshold for identifying helicases
    
    
    config.shotnoiseExposureTime= [50 100 300] ;    % Exposure time in miliseconds
    config.checkerBoardSizeSplit=5;                 % Size for the blocks in the checkerboard pattern used to check if the split correlation works.
    config.checkerBoardSizeCamera=3;                % Size for the blocks in the checkerboard pattern used to check if the camera correlation works.
    config.cropOffset=5;                            % Offset used in cropping images
    config.waveLength=488e-9;                       % Wavelength of the emitted light from the fluorophores
    config.numFactor=0.25;                          % Numerical factor which determines the width of the PSF
    config.numericalAperture = 1.4;
    
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
    
    % Region to crop after performing non linear correction 
    % [minX, maxX, minY, maxY] 
    config.cropCoordinatesNonLinear = [37, 245, 5, 470]; 
    
    % No need to edit anything below here!
    config.pixelSize=config.imageSize/config.pixels;                                         % size in meters per pixel
    config.sigma=config.waveLength/(2*pi*config.pixelSize*sqrt(2*config.numFactor));         % sigma used to generate the Gaussian in pixels
    config.fitIterations = 10;
    % FitType for GaussMLEv2
    config.fitType = 2;
    config.fitSize=  1+ceil(3*config.sigma);    % Half size  of the patch where we are going to fit Gaussians.
                                             % For instance if the patch is 25x25 choose 12
                                             % A guideline for this is 3*sigma
                                             
    % Make sure we can use the functions
    addpath( genpath('./Functions') )

end

