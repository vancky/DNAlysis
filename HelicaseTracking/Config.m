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
    config.matFileCd=('../../../MatFiles/DnaHelicaseImports/170531C10.mat');
    % The directory with helicase and dna images
    config.helicaseCd{1}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170620_132228\Ch4MIX-DNApostMCMFOV1-AFTERwashing*\*211_0*');
    config.helicaseCd{2}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170620_132228\Ch4MIX-DNApostMCMFOV1-AFTERwashingFOV2*\*cam0_223_0*');
    config.helicaseCd{3}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170620_132228\Ch4MIX-DNApostMCMFOV1-AFTERwashingFOV3-488at30mW*\*cam0_235_0*');
    config.helicaseCd{4}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170620_132228\Ch4MIX-DNApostMCMFOV1-AFTERwashingFOV4-488at30mW*\*cam0_247_0*');
    config.helicaseCd{5}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170620_132228\Ch4MIX-DNApostMCMFOV1-AFTERwashingFOV4-488at30mWonly488*\*cam0_251_0*');
    config.helicaseCd{6}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170620_132228\Ch4MIX-DNApostMCMFOV1-AFTERwashingFOV4-488at30mWonly642*\*cam0_255_0*');
    config.helicaseCd{7}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170620_132228\Ch4MIX-DNApostMCMFOV1-AFTERwashingFOV5-488at30mW*\*cam0_267_0*');
    config.helicaseCd{8}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170620_132228\Ch4MIX-DNApostMCMFOV1-AFTERwashingFOV6-488at30mW*\*cam0_279_0*');
    config.helicaseCd{9}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170620_132228\Ch4MIX-DNApostMCMFOV1-AFTERwashingFOV7-488at30mW*\*cam0_291_0*');
    config.helicaseCd{10}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170620_132228\Ch4MIX-DNApostMCMFOV1-AFTERwashingFOV8-488at50mW*\*cam0_303_0*');
    config.helicaseCd{11}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170620_132228\Ch4MIX-DNApostMCMFOV1-AFTERwashingFOV9-488at30mWlastnoflow*\*cam0_315_0*');
    config.dnaCd{1}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170530_104553\02-Exp13-FOV1-DNA-MCM-reSytox-532*\*cam0_270_0*');    
    config.dnaCd{2}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170530_104553\02-Exp13-FOV2-DNA-MCM-reSytox-532*\*cam0_286_0*');    
    config.dnaCd{3}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170530_104553\02-Exp13-FOV3-DNA-MCM-reSytox-532*\*cam0_302_0*');    
    config.dnaCd{4}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170530_104553\02-Exp13-FOV4-DNA-MCM-reSytox-532*\*cam0_318_0*');    
    config.dnaCd{5}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170530_104553\02-Exp13-FOV5-DNA-MCM-reSytox-532*\*cam0_360_0*');    
    config.dnaCd{6}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170530_104553\02-Exp13-FOV6-DNA-MCM-reSytox-532*\*cam0_376_0*');    
    config.dnaCd{7}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170530_104553\02-Exp13-FOV7-DNA-MCM-reSytox-532*\*cam0_392_0*');    
    config.dnaCd{8}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170530_104553\02-Exp13-FOV8-DNA-MCM-reSytox-532*\*cam0_408_0*');    
    config.dnaCd{9}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170530_104553\02-Exp13-FOV8-DNA-MCM-reSytox-532*\*cam0_408_0*');    
    config.dnaCd{10}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170530_104553\02-Exp13-FOV8-DNA-MCM-reSytox-532*\*cam0_408_0*');    
    config.dnaCd{11}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170530_104553\02-Exp13-FOV8-DNA-MCM-reSytox-532*\*cam0_408_0*');    

    % Directories for correcting Data
    config.splitCorrelationCd{1} =('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170424_104237\00-beads-05*\*cam0_015_0*');
    config.dnaCalibrationCd{1} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170530_104553\02-Exp13-FOV5-DNA-MCM-reSytox-532*\*cam0_360_0*');    

    
    % Set the parameters

    config.pixels= 512;                     % Pixels per image
    config.imageSize=40e-6;                 % Size of the image in m
    config.dataType=('uint16');             % The data type of the images
    config.luckyStackSize = 1;              % Stack size for the lucky algorithm
    config.luckyThreshold = 0.1;            % Best fraction of gaussians allowed by the algorithm (0.2 equals 20%)
    config.rollingBallConstant = 30;        % The radius of the rolling ball filter used throughout the scripts
    config.binaryCloseRadius = 4;           % The radius of the disk-shaped element used to close the DNA in the MatchDnaHelicase script
    
    config.diameterThreshold = 4;              % Area threshold in pixels for identifying helicases
    config.eccentricityThreshold = 0.9;      % Eccentricity threshold for identifying helicases
    
    config.shotnoiseExposureTime= [50 100 300] ;    % Exposure time in miliseconds
    config.checkerBoardSizeSplit=5;                 % Size for the blocks in the checkerboard pattern used to check if the split correlation works.
    config.checkerBoardSizeCamera=5;                % Size for the blocks in the checkerboard pattern used to check if the camera correlation works.
    config.cropOffset=5;                            % Offset used in cropping images
    config.waveLength=488e-9;                       % Wavelength of the emitted light from the fluorophores
    config.numFactor=0.25;                          % Numerical factor which determines the width of the PSF
    config.numericalAperture = 1.4;
    
    
    
    % No need to edit anything below here!
    config.pixelSize=config.imageSize/config.pixels;                                         % size in meters per pixel
    config.sigma=config.waveLength/(2*pi*config.pixelSize*sqrt(2*config.numFactor));         % sigma used to generate the Gaussian in pixels
    config.fitSize= ceil(3*config.sigma);    % Half size  of the patch where we are going to fit Gaussians.
                                             % For instance if the patch is 25x25 choose 12
                                             % A guideline for this is 3*sigma
                                             
    % Make sure we can use the functions
    addpath(genpath('./Functions'))

end

