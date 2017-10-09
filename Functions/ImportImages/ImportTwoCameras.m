function [ output ] = ImportTwoCameras( cdName, importType )
    % Import Two Cameras - Imports images from cam 0 and cam 1
    % Give as inputs the cd of the folder to import
    
    
    numFolders=size(cdName.cam0,2);
    
    for i = 1:numFolders
        fprintf('Importing images from folder %d/%d.\n', i, numFolders);
        directory0 = dir( cdName.cam0{i});
        numFiles0 = length( directory0 );
        
        directory1= dir( cdName.cam1{i});
        numFiles1 = length( directory1 );
        
        if numFiles0 == 0
            fprintf('You have specified an incorrect directory in folder %i.\n %s \n', i, cdName.cam0{i})
        end
        
        if numFiles1 == 0
            fprintf('You have specified an incorrect directory in folder %i.\n %s \n', i, cdName.cam1{i})
        end
        
        switch importType
            case 'stack'
                output.cam0{i} = 0;
                output.cam1{i} = 0;
                for k = 1:numFiles0
                    dirK0 = sprintf( '%s%s%s', directory0(k).folder, '\', directory0(k).name);  % finds the k-th directory
                    image0 = imread(dirK0);            %Import the images from cam 0
                    output.cam0{i} = output.cam0{i}+double(image0)/numFiles0;
                end
                for j = 1:numFiles1
                    dirK1 = sprintf( '%s%s%s', directory1(j).folder, '\', directory1(j).name);  % finds the k-th directory
                    image1 = imread(dirK1);            %Import the images from cam 1
                    output.cam1{i} = output.cam1{i}+ double(image1)/numFiles1;
                end
                
            case 'all'
                for k = 1:numFiles0
                    dirK0 = sprintf( '%s%s%s', directory1(k).folder, '\', directory0(k).name);  % finds the k-th directory
                    image0 = imread(dirK0);             %Import the images from cam 0
                    output.cam0{i}(:,:,k) = image0;
                end
                for j = 1:numFiles1
                    dirK0 = sprintf( '%s%s%s', directory1(j).folder, '\', directory1(j).name);  % finds the k-th directory
                    image1 = imread(dirK0);             %Import the images from cam 1
                    output.cam1{i}(:,:,j) = image1;
                end
                
            otherwise
                fprintf('Specify importtype.\n')
                
        end
    end
end

