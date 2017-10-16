function [ config ] = Config( config, user )
    % Config - File where the user can specify his/her preferences

    
    % Specify whether you want to import images from the K drive or load
    % saved images from the MatFileCd
    config.importOption = 'load';
    
    switch user
        case 'tudelft'                
            config.matlabCd=('D:\jvanderauweraert\git\DNAlysis\HelicaseTracking');
            % The matfile Cd, note that we can load images by specifying the
            % correct .mat file name, if saving, specify the new relevant name
            config.saveMatFileCd=('../../../MatFiles/Calibrations/mcm646');
            config.loadMatFileCd=('../../../MatFiles/Calibrations/mcm646');
        case 'home'
            config.matlabCd=('/home/private/thesisCode/DNAlysis/HelicaseTracking');
            config.saveMatFileCd=('../../MatFiles/Calibrations/mcm646');
            config.loadMatFileCd=('../../MatFiles/Calibrations/mcm646');
        otherwise
            fprintf('Please specify a correct user.\n')
    end
    
    config.calibrationCd{1} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\171010\C6\FOV1 2*\*image1*');

    % Make sure we can use the functions
    addpath( genpath('../Functions') )
    addpath( genpath('./Functions') )
end

