function [ output ] = ImportOneCamera( cdName )
    % Import One Camera - Imports images from one specific camera
    % Give as inputs the cd of the folder to import

    numFolders=size(cdName,2);

    for i=1:numFolders
        fprintf('Importing images from folder %d/%d.\n',i,numFolders);
        directory = dir( cdName{i});                        % Labels all the tiffFiles with cam0 in the current directory
        numFiles = length(directory);                       % Number of individual image
        output{i}=0;
        for k = 1:numFiles
            dirK=sprintf( '%s%s%s' , directory(k).folder , '\' , directory(k).name );  % finds the k-th directory
            image=imread(dirK);             %Import the images from cam 0
            output{i}=output{i}+double(image);
        end
        output{i}=output{i}/numFiles;
    end

end

