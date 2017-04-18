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
    config.imageCd=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheresLED');
    config.dnaCd{1}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170407_094257\DNASytox*\*cam0_079_0*');
    config.helicaseCd{1}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170407_094257\DNASytoxafterMCM488*\*cam0_115_0*');
    
    
    % Directories for correcting Data
    config.beamshapeCd{1}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheres488AfcontinuiosTrue*\*273_0*');
    config.splitCorrelationCd{1}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheresLED*\*cam0_193_0*');
    config.cameraCorrelationCd{1}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheres48840mW*\*184_0*');
    config.cameraCorrelationCd{2}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheres53220mW*\*187_0*');
    config.cameraCorrelationCd{3}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\FSspheres64240mW*\*190_0*');
    config.noiseCd{1}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\Shotnoise50ms*\*290_0*');
    config.noiseCd{2}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\Shotnoise100ms*\*282_0*');
    config.noiseCd{3}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170321_103054\Shotnoise300ms*\*279_0*');
    
    % Set the parameters

    config.pixels= 512;                     % Pixels per image
    config.imageSize=40e-6;                 % Size of the image in m
    config.dataType=('uint16');             % The data type of the images
     
    
    config.shotnoiseExposureTime= [50 100 300] ;    % Exposure time in miliseconds
    config.checkerBoardSizeSplit=5;                 % Size for the blocks in the checkerboard pattern used to check if the split correlation works.
    config.checkerBoardSizeCamera=5;                % Size for the blocks in the checkerboard pattern used to check if the camera correlation works.
    config.cropOffset=3;                            % Offset used in cropping images
    config.waveLength=600e-9;                       % Wavelength of the emitted light from the fluorophores
    config.numFactor=0.25;                          % Numerical factor which determines the width of the PSF
    
    config.fitSize= 5;                       % Half size  of the patch where we are going to fit Gaussians.
                                             % For instance if the patch is 25x25 choose 12
                                             % A guideline for this is 3*sigma
    % No need to edit anything below here!
    config.pixelSize=config.imageSize/config.pixels;                                         % size in meters per pixel
    config.sigma=config.waveLength/(2*pi*config.pixelSize*sqrt(2*config.numFactor));         % sigma used to generate the Gaussian in pixels

    % Make sure we can use the functions
    addpath ./Functions
    addpath ./Functions/SimulateData
    addpath ./Functions/Util
    addpath ./Functions/HelicaseFitting
    addpath ./Functions/BeamshapeCorrection
    addpath ./Functions/Filters
    addpath ./Functions/LuckyImaging
    addpath(genpath('./Functions/gaussmlev2'))
end

