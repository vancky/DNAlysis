function [ output ] = ImportTwoCameras( cdName )
    % Import Two Cameras - Imports images from cam 0 and cam 1
    % Give as inputs the cd of the folder to import

    numFolders=size(cdName,2);

    for i=1:numFolders
        fprintf('Importing images from folder %d/%d.\n',i,numFolders);
        
        % Split up the cd into a part with cam0 and a part with cam1
        
        cdLength=length(cdName{i});
        splitNumber=strfind(cdName{i} , '*\');
        splitCdLeft=cdName{i}(1:splitNumber);
        splitCdRight=cdName{i}(splitNumber+3:cdLength); 
        cdName0{i}=sprintf('%s%s',splitCdLeft, '\*cam0_', splitCdRight );
        cdName1{i}=sprintf('%s%s',splitCdLeft, '\*cam1_', splitCdRight );
        
        % Import Camera 0
        
        directory0 = dir( cdName0{i});                        % Labels all the tiffFiles with cam0 in the current directory
        numFiles0 = length(directory0);                    % Number of individual image
        output{i}.cam0=0;
        for k = 1:numFiles0
            dirK=sprintf( '%s%s%s' , directory0(k).folder , '\' , directory0(k).name );  % finds the k-th directory
            image=imread(dirK);             %Import the images from cam 0
            output{i}.cam0=output{i}.cam0+double(image);
        end
        output{i}.cam0=output{i}.cam0/numFiles0;
        
        % Import Camera 1
        
        directory1 = dir( cdName1{i});                        % Labels all the tiffFiles with cam0 in the current directory
        numFiles1 = length(directory1);                    % Number of individual image
        output{i}.cam1=0;
        for k = 1:numFiles1
            dirK=sprintf( '%s%s%s' , directory1(k).folder , '\' , directory1(k).name );  % finds the k-th directory
            image=imread(dirK);             %Import the images from cam 0
            output{i}.cam1=output{i}.cam1+double(image);
        end
        output{i}.cam1=output{i}.cam1/numFiles1;
    end

end

