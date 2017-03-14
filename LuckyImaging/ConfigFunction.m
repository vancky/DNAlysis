function [ config ] = ConfigFunction( config )
    % ConfigFunction - configurates settings
    % No need to edit this function!
    
    % Set the current directory to the folder with the matlab files
    cd(config.matlabCd{1}); 
    
    % Add the neccesary paths so that we can use the functions
    addpath ./Functions;
    addpath ./Functions/Util;
    addpath ./Functions/CLEAN;
end

