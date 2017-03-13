function [ importImage ] = ImportImages( config )
    %ImportImage - Imports all images in Matlab
    %We get a set of roughly 300 individual images per measurements
    %These images are kept in one structure (importImage)

    importImage=struct();
    cd(config.imageCd{1});                        % Sets image folder
    directory = dir('*cam0*.tiff');               % Labels all the tiffFiles with cam0 in the current directory
    numFiles = length(directory);                 % Number of individual image
    
    parfor k = 1:numFiles  
        importImage(k).image=imread(directory(k).name);             %Import the images
    end
    
    cd(config.matlabCd{1})                                  %Resets the cd to the matlab script location
end