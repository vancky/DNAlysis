function [ config ] = GeneralConfig( config, user )
    % General Config - Sets up the general configuration settings which are
    % similar for the individual experiments

    switch user
        case 'tudelft'                
            config.matlabCd=('D:\jvanderauweraert\git\DNAlysis\HelicaseTracking');
            % The matfile Cd, note that we can load images by specifying the
            % correct .mat file name, if saving, specify the new relevant name
            config.matFilePath = '../../../MatFiles/';
        case 'home'
            config.matlabCd=('/home/private/thesisCode/DNAlysis/HelicaseTracking');
            config.matFilePath= '../../MatFiles/';
        otherwise
            fprintf('Please specify a correct user.\n')
    end

    % GENERAL SETTINGS
    % Pixels per image
    config.pixels= 512;                     
    % Size of the image in m
    config.imageSize=40e-6;                                    
    % Numerical factor which determines the width of the PSF (from literature)
    config.numFactor = 0.25;                          
    % Size in meters per pixel
    config.pixelSize = config.imageSize/config.pixels;    
    
end

