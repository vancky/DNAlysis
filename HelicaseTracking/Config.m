function [ config ] = Config( config )
    % Config - File where the user can specify his/her preferences
    
    
    % Set the Matlab directory
    config.matlabCd=('D:\jvanderauweraert\git\DNAlysis\HelicaseTracking');
    config.beamshapeCd=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheres488AfcontinuiosTrue');
    config.imageCd=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheresLED');
    
    % Set the parameters

    config.pixels= 512;                     % Pixels per image
    config.imageSize=40e-6;                 % Size of the image in m
    config.dataType=('uint16');             % The data type of the images
     
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

