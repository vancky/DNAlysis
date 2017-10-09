function [ config ] = Config( config, user )
    % Config - File where the user can specify his/her preferences

    
    % Specify whether you want to import images from the K drive or load
    % saved images from the MatFileCd
    config.importOption = 'import';
    
    switch user
        case 'tudelft'                
            config.matlabCd=('D:\jvanderauweraert\git\DNAlysis\HelicaseTracking');
            % The matfile Cd, note that we can load images by specifying the
            % correct .mat file name, if saving, specify the new relevant name
            config.saveMatFileCd=('../../../MatFiles/RpaAnalysis/octNovData');
            config.loadMatFileCd=('../../../MatFiles/RpaAnalysis/octNovData');
        case 'home'
            config.matlabCd=('/home/private/thesisCode/DNAlysis/HelicaseTracking');
            config.saveMatFileCd=('../../MatFiles/RpaAnalysis/octNovData');
            config.loadMatFileCd=('../../MatFiles/RpaAnalysis/octNovData');
        otherwise
            fprintf('Please specify a correct user.\n')
    end

    % Set the Matlab directories, note if you want to specify only a
    % certain camera or measurement set use \folder*\*specificextension*
    % For instance for camera 0 with extension 079 Cd=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170407_094257\DNASytox*\*cam0_079*')
    % For camera 1 and 0 with extension 079: Cd=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170407_094257\DNASytox*\*_079*')
    % For all files in the folder Cd=('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170407_094257\DNASytox*\**')
    % 
    % Note if there are other images such as cam0_290_stack, simply adjust
    % set cam0_290_0 instead of cam0_290 to make sure you don't import the
    % stack image.
    
    config.importType = 'twoCameras';
    % In case of importing from both cam 0 and cam 1 use this part
    config.multiCamCd.cam0{1} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170919\C1L\Firing 3*\*image0*');
    config.multiCamCd.cam1{1} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170919\C1L\Firing 3*\*image1*');
    config.multiCamCd.cam0{2} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170920\C6L\Firing 3*\*image0*');
    config.multiCamCd.cam1{2} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170920\C6L\Firing 3*\*image1*');
    config.multiCamCd.cam0{3} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\171004\C6\Loading 7*\*image0*');
    config.multiCamCd.cam1{3} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\171004\C6\Loading 7*\*image1*');
    config.multiCamCd.cam0{4} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\171004\c8\ddK 7*\image0*');
    config.multiCamCd.cam1{4} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\171004\c8\ddK 7*\image1*');
%     config.multiCamCd.cam0{5} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170920\C7L 2*\*image0*');
%     config.multiCamCd.cam1{5} = ('K:\bn\nd\Shared\Humberto Sanchez\G0.181\170920\C7L 2*\*image1*');
   
    
    % Make sure we can use the functions
    addpath( genpath('../Functions') )
    addpath( genpath('./Functions') )

end

