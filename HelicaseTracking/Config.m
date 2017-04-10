function [ config ] = Config( config )
    % Config - File where the user can specify his/her preferences
    
    
    % Set the Matlab directory
    config.matlabCd=('D:\jvanderauweraert\git\DNAlysis\HelicaseTracking');
    config.beamshapeCd=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheres488AfcontinuiosTrue');
    config.imageCd=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheresLED');
    config.splitCorrelationCd=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheresLED');
    config.cameraCorrelationCd{1}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheres48840mW');
    config.cameraCorrelationCd{2}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheres53220mW');
    config.cameraCorrelationCd{3}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheres64240mW');
    
    % Set the parameters

    config.pixels= 512;                     % Pixels per image
    config.imageSize=40e-6;                 % Size of the image in m
    config.dataType=('uint16');             % The data type of the images
     
    
    config.checkerBoardSize=20;             % Size for the blocks in the checkerboard pattern used to check if the correlation works.
    
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

