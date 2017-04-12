function [ output ] = ImportMultipleImages( config, cdName , dirLabel )
    %ImportLaserImage - Simultaneously import images from different cameras
    %Input a structure where the fields contain the directories of the diferent lasers
    
    numFolders=size(cdName,2);
    dir0Check=sprintf('*cam0_%i*.tiff',dirLabel)
    dir1Check=sprintf('*cam1_%i*.tiff',dirLabel)
    
    for i=1:numFolders
        fprintf('Importing images from folder %d/%d.\n',i,numFolders);
        cd(cdName{i});                                          % Sets image folder
        directory0 = dir( dir0Check );                        % Labels all the tiffFiles with cam0 in the current directory
        directory1 = dir( dir1Check );                        % Labels all the tiffFiles with cam0 in the current directory
        numFiles0 = length(directory0);                         % Number of individual image
        numFiles1 = length(directory0);
        output{i}.cam0=0;
        output{i}.cam1=0;
        
        for k = 1:numFiles0
            k
            image0=imread(directory0(k).name);             %Import the images from cam 0
            output{i}.cam0=output{i}.cam0+double(image0);
        end
        output{i}.cam0=output{i}.cam0/numFiles0;

        for j = 1:numFiles1
            image1=imread(directory1(j).name);             %Import the images from cam 1
            output{i}.cam1=output{i}.cam1+double(image1);
        end
        output{i}.cam1=output{i}.cam1/numFiles0;
        
        cd(config.matlabCd)                                  %Resets the cd to the matlab script location
    end

end

