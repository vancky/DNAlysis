% Input configuration

% Please fill in these two lines :)
config.MatlabCd= {'K:\bn\nd\Shared\JaspervdAuweraert\Matlab\DNALengthFinder' };    % The directory where the matlab files are located
config.ImageCd={'K:\bn\nd\Shared\JaspervdAuweraert\Data\Feb0to1ul'};               % The directory where the images to analyze are located
% All set? Don't worry about the lines below. You can run the Main file now!

cd(config.MatlabCd{1});                                   %Set the correct directory

config.SubFolders=genpath(config.ImageCd{1});                 %obtain subfolder names
config.Remain = config.SubFolders;
config.ListOfFolderNames = {};

while true                                              %Loop to neatly arrange the subfolders in an array
	[config.SingleSubFolder, config.Remain] = strtok(config.Remain, ';');
	if isempty(config.SingleSubFolder)
		break;
	end
	config.ListOfFolderNames = [config.ListOfFolderNames config.SingleSubFolder];
end
config.NumberOfFolders = length(config.ListOfFolderNames);

for j=1:(config.NumberOfFolders-1)                   %Loop where the user can choose subfolders to analyse
    % we use j+1 in ListOfFolderNames, because j=1 is the root directory.
    % (this is also the reason for the config.NumberOfFolders-1 in the for loop)
    config.Prompt2 = {strcat(config.ListOfFolderNames{j+1},sprintf('\nThe following subfolder was found.'),sprintf('\nDo you want to analyse this folder? (Type 1 for yes or 0 for no)')), 'What was the fluid velocity in this measurement? (use a dot to separate i.e. 9.9, the unit is ul/min)'};  
    config.DlgTitle2 = 'Choose subfolders to analyse';
    config.NumLines2 = 1;
    config.DefaultAns2 = {'','9.9'};
    config.Ans2{j} = inputdlg(config.Prompt2,config.DlgTitle2,config.NumLines2,config.DefaultAns2);   
        if str2double(cell2mat(config.Ans2{j}(1)))==1
            config.OutputCd{j}=config.ListOfFolderNames{j+1};
            config.OutputVelocity(j)=str2num(cell2mat(config.Ans2{j}(2)));
        else 
            config.OutputCd{j}={};
            config.OutputVelocity(j)=0;
        end
end

config.FilterCells=~cellfun('isempty',config.OutputCd);          % Filter out the cells which don't need to be analyzed
config.OutputCd=config.OutputCd(config.FilterCells);
config.OutputVelocity=config.OutputVelocity(config.FilterCells);
config.NumberOfMeasurements=length(config.OutputVelocity);
config.Cmap=[];                                                  %Usually obtained from [A,cmap]=imread(..), but for this case it is just an empty matrix.
