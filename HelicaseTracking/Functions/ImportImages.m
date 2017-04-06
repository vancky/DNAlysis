function [ importImage ] = ImportImages( config )
    %ImportImage - Imports all images in Matlab
    %We get a set of roughly 300 individual images per measurements
    %These images are kept in one structure (importImage)

    importImage=struct();
    cd(config.imageCd);                        % Sets image folder
    directory = dir('*cam0*.tiff');               % Labels all the tiffFiles with cam0 in the current directory
    importImage.numFiles = length(directory);                 % Number of individual image
    
    for k = 1:importImage.numFiles  
        importImage.image{k}=imread(directory(k).name);             %Import the images
    end
    
    cd(config.matlabCd)                                  %Resets the cd to the matlab script location
end