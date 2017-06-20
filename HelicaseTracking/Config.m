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
    
    config.matFileCd=('../../../MatFiles/DnaHelicaseImports/170530Exp8.mat');
    
%     config.helicaseCd{1}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170523_110945\Exp9r-Ch9-FOV1-DNA-MCM-resSytox488b*\*cam0_113_0*');
%     config.helicaseCd{2}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170523_110945\Exp9r-Ch9-FOV2-DNA-MCM-resSytox488*\*cam0_125_0*');
%     config.helicaseCd{3}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170523_110945\Exp9r-Ch9-FOV3-DNA-MCM-resSytox488*\*cam0_141_0*');
%     config.helicaseCd{4}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170523_110945\Exp9r-Ch9-FOV4-DNA-MCM-resSytox488*\*cam0_157_0*');
%     config.helicaseCd{5}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170523_110945\Exp9r-Ch9-FOV5-DNA-MCM-resSytox488*\*cam0_173_0*');
%     config.helicaseCd{6}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170523_110945\Exp9r-Ch9-FOV7-DNA-MCM-resSytox488*\*cam0_229_0*');
%     config.helicaseCd{7}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170523_110945\Exp9r-Ch9-FOV8-DNA-MCM-resSytox488*\*cam0_245_0*');
%     config.helicaseCd{8}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170523_110945\Exp9r-Ch9-FOV9-DNA-MCM-resSytox488*\*cam0_261_0*');                           
%     
%     config.dnaCd{1}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170523_110945\Exp9r-Ch9-FOV1-DNA-MCM-resSytox532b*\*cam0_109_0*');
%     config.dnaCd{2}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170523_110945\Exp9r-Ch9-FOV2-DNA-MCM-resSytox532*\*cam0_129_0*');
%     config.dnaCd{3}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170523_110945\Exp9r-Ch9-FOV3-DNA-MCM-resSytox532*\*cam0_145_0*');
%     config.dnaCd{4}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170523_110945\Exp9r-Ch9-FOV4-DNA-MCM-resSytox532*\*cam0_161_0*');
%     config.dnaCd{5}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170523_110945\Exp9r-Ch9-FOV5-DNA-MCM-resSytox532b*\*cam0_197_0*');
%     config.dnaCd{6}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170523_110945\Exp9r-Ch9-FOV7-DNA-MCM-resSytox532*\*cam0_233_0*');
%     config.dnaCd{7}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170523_110945\Exp9r-Ch9-FOV8-DNA-MCM-resSytox532*\*cam0_249_0*');
%     config.dnaCd{8}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170523_110945\Exp9r-Ch9-FOV9-DNA-MCM-resSytox532*\*cam0_265_0*');
    
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

