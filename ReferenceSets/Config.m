function [ config ] = Config( config )
    % Config - File where the user can specify his/her preferences
    
    
    % The matlab directory
    config.matlabCd=('D:\jvanderauweraert\git\DNAlysis\PerformanceCriteria');
    
    % Directory for saving the reference sets
    config.referenceSetSaveCd =('../../../MatFiles/ReferenceSets/');
    
    % General specifications of simulated data
    config.imageSize = [512, 256];
    
    % Simulate helicase specs
    config.sigma = 1.5;             % The sigma of the Gaussian PSF to simulate helicases
    config.scaleValue = 50;       % Maximum intensity of the helicase spot
    % Simulate dna specs
    config.dnaSize = [60, 1];     % Size of the DNA in pixels before blurring
    config.dnaIntensity = 1500;   % Intensity of the DNA before blurring
    config.blurSize = 2;          % Sigma of the Gaussian blur
    
    % Directories for correcting Data
    % Reference Set 1
    config.referenceSet1Cd{1} =('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170424_104237\00-beads-05*\*cam0_015_0*');
    config.helicaseThreshold1 = 7;
    config.smoothRadius1 = 3;
    
    % Reference Set 2
    config.helicaseThreshold2 = 6;
    config.smoothRadius2 = 3;
    config.dnaThreshold2 = 200;
    config.binaryCloseRadius = 4; 
    config.diameterThreshold = 4;

    
    % 10mW case
    config.referenceSet2HelicaseCd{1}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170530_104553\02-Exp13-FOV1-DNA-MCM-reSytox-488*\*cam0_266_0*');
    config.referenceSet2HelicaseCd{2}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170530_104553\02-Exp13-FOV4-DNA-MCM-reSytox-488*\*cam0_316_0*');
    config.referenceSet2HelicaseCd{3}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170530_104553\02-Exp13-FOV7-DNA-MCM-reSytox-488*\*cam0_388_0*');
    % 30mW case
    config.referenceSet2HelicaseCd{4}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170620_132228\Ch4MIX-DNApostMCMFOV1-AFTERwashingFOV4-488at30mW*\*cam0_247_0*');
    config.referenceSet2HelicaseCd{5}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170620_132228\Ch4MIX-DNApostMCMFOV1-AFTERwashingFOV4-488at30mWonly488*\*cam0_251_0*');
    %Dna
    config.referenceSet2DnaCd{1}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170530_104553\02-Exp13-FOV1-DNA-MCM-reSytox-532*\*cam0_270_0*');    
    config.referenceSet2DnaCd{2}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170530_104553\02-Exp13-FOV7-DNA-MCM-reSytox-532*\*cam0_392_0*');    
    config.referenceSet2DnaCd{3}=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170530_104553\02-Exp13-FOV6-DNA-MCM-reSytox-532*\*cam0_376_0*');    
    
    % Reference Set 3
    config.helicaseThreshold3 = 4;
    config.dnaThreshold3 = 50;

    % Make sure we can use the functions
    addpath(genpath('./Functions'))
end

