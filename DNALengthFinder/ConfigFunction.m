function [ config ] = ConfigFunction( config)
    % CONFIGFUNCTION
    % This function obtains the subfolders which the user wants to analyse.
    % There is no need to edit anything here!
   
    cd(config.matlabCd{1});                                %Set the correct directory
    subFolders=genpath(config.imageCd{1});                 %obtain subfolder names
    remain = subFolders;
    listOfFolderNames = {};

    while true                                              %Loop to neatly arrange the subfolders in an array
        [singleSubFolder, remain] = strtok(remain, ';');
        if isempty(singleSubFolder)
            break;
        end
        listOfFolderNames = [listOfFolderNames singleSubFolder];
    end
    numberOfFolders = length(listOfFolderNames);

    for j=1:(numberOfFolders-1)                   %Loop where the user can choose subfolders to analyse
        % we use j+1 in listOfFolderNames, because j=1 is the root directory.
        % (this is also the reason for the config.numberOfFolders-1 in the for loop)
        %prompt = {strcat(listOfFolderNames{j+1},sprintf('\nThe following subfolder was found.'),sprintf('\nDo you want to analyse this folder? (Type 1 for yes or 0 for no)')), 'What was the fluid velocity in this measurement? (use a dot to separate i.e. 9.9, the unit is ul/min)'};  
        prompt = {sprintf('%s%s%s', listOfFolderNames{j+1}, ...
            '\nThe following subfolder was found.', ...
             '\nDo you want to analyse this folder? (Type 1 for yes or 0 for no)'), ...
             sprintf('What was the fluid velocity in this measurement? (use a dot to separate i.e. 9.9, the unit is ul/min)')};  
        dlgTitle = 'Choose subfolders to analyse';
        numLines = 1;
        defaultAns = {'0','9.9'};
        ans{j} = inputdlg(prompt,dlgTitle,numLines,defaultAns);   
            if str2double(cell2mat(ans{j}(1)))==1
                config.subImageCd{j}=listOfFolderNames{j+1};
                config.outputVelocity(j)=str2num(cell2mat(ans{j}(2)));
            else 
                config.subImageCd{j}={};
                config.outputVelocity(j)=0;
            end
    end

    filterCells=~cellfun('isempty',config.subImageCd);          % Filter out the cells which don't need to be analyzed
    config.subImageCd=config.subImageCd(filterCells);
    config.outputVelocity=config.outputVelocity(filterCells);
    config.numberOfMeasurements=length(config.outputVelocity);
    config.cmap=[];                                                  %Usually obtained from [A,cmap]=imread(..), but for this case it is just an empty matrix.
    
    %Here, the function directories are added
    addpath ./Functions/                            
    addpath ./Functions/Util
    addpath ./Functions/Filters
    addpath ./Functions/gaussmlev2
end

