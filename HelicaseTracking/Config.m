function [ config ] = Config( config )
    % Config - File where the user can specify his/her preferences
    
    
    % Set the Matlab directories, note if you want to specify only a
    % certain camera or measurement set use \folder*\*specificextension*
    % For instance for camera 0 with extension 079 Cd=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170407_094257\DNASytox*\*cam0_079*')
    % For camera 1 and 0 with extension 079: Cd=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170407_094257\DNASytox*\*_079*')
    % For all files in the folder Cd=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170407_094257\DNASytox*\')
    
    config.matlabCd=('D:\jvanderauweraert\git\DNAlysis\HelicaseTracking');
    config.imageCd=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheresLED');
    config.helicaseCd{1}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170407_094257\DNASytox*\*cam0_079*');
    config.dnaCd{1}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170407_094257\DNASytoxafterMCM488');
    
    
    % Directories for correcting Data
    config.beamshapeCd=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheres488AfcontinuiosTrue');
    config.beamshapeDirLabelCam0=('*cam0_273*.tiff');
    config.beamshapeDirLabelCam1=('*cam1_273*.tiff');
    config.splitCorrelationCd{1}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheresLED');
    config.cameraCorrelationCd{1}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheres48840mW');
    config.cameraCorrelationCd{2}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheres53220mW');
    config.cameraCorrelationCd{3}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheres64240mW');
    config.noiseCd{1}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\Shotnoise50ms');
    config.noiseCd{2}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\Shotnoise100ms');
    config.noiseCd{3}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\Shotnoise300ms');
    
    
    
    
    % Set the parameters

    config.pixels= 512;                     % Pixels per image
    config.imageSize=40e-6;                 % Size of the image in m
    config.dataType=('uint16');             % The data type of the images
     
    
    config.checkerBoardSizeSplit=5;             % Size for the blocks in the checkerboard pattern used to check if the split correlation works.
    config.checkerBoardSizeCamera=5;             % Size for the blocks in the checkerboard pattern used to check if the camera correlation works.
    % No need to edit anything below here!
      
    % Make sure we can use the functions
    addpath ./Functions
    addpath ./Functions/SimulateData
    addpath ./Functions/Util
    addpath ./Functions/HelicaseFitting
    addpath ./Functions/BeamshapeCorrection
    addpath ./Functions/Filters
    addpath(genpath('./Functions/gaussmlev2'))
end

