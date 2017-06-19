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
    
    config.matFileCd=('../../../MatFiles/DnaHelicaseImports/170517C5.mat');
    config.helicaseCd{1}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170517_104430\11-C5-FOV1-488*\*cam0_122_0*');
    config.helicaseCd{2}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170517_104430\11-C5-FOV2-488*\*cam0_140_0*');
    config.helicaseCd{3}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170517_104430\11-C5-FOV3-488*\*cam0_164_0*');
    config.helicaseCd{4}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170517_104430\11-C5-FOV4-488*\*cam0_184_0*');
    config.helicaseCd{5}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170517_104430\11-C5-FOV5-488good*\*cam0_218_0*');
    config.helicaseCd{6}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170517_104430\11-C5-FOV6-488*\*cam0_236_0*');
    config.helicaseCd{7}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170517_104430\11-C5-FOV7-488*\*cam0_252_0*');
    config.helicaseCd{8}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170517_104430\11-C5-FOV8-488*\*cam0_268_0*');
    config.helicaseCd{9}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170517_104430\11-C5-FOV9-488*\*cam0_282_0*');
    
    config.dnaCd{1}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170517_104430\11-C5-FOV1-532*\*cam0_110_0*');
    config.dnaCd{2}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170517_104430\11-C5-FOV2-532*\*cam0_132_0*');
    config.dnaCd{3}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170517_104430\11-C5-FOV3-532*\*cam0_156_0*');
    config.dnaCd{4}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170517_104430\11-C5-FOV4-532*\*cam0_176_0*');
    config.dnaCd{5}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170517_104430\11-C5-FOV5-532*\*cam0_202_0*');
    config.dnaCd{6}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170517_104430\11-C5-FOV6-532*\*cam0_228_0*');
    config.dnaCd{7}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170517_104430\11-C5-FOV7-532*\*cam0_246_0*');
    config.dnaCd{8}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170517_104430\11-C5-FOV8-532*\*cam0_260_0*');
    config.dnaCd{9}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170517_104430\11-C5-FOV9-532*\*cam0_276_0*');
    

    config.numFovs = length( config.helicaseCd);
    
    % Directories for correcting Data
    config.splitCorrelationCd{1}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170424_104237\00-beads-05*\*cam0_015_0*');

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
    addpath ./Functions
    addpath ./Functions/SimulateData
    addpath ./Functions/Util
    addpath ./Functions/HelicaseFitting
    addpath ./Functions/BeamshapeCorrection
    addpath ./Functions/Filters
    addpath ./Functions/LuckyImaging
    addpath ./Functions/Visualisation
    addpath(genpath('./Functions/gaussmlev2'))
end

