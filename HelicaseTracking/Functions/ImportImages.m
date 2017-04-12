function [ importImages ] = ImportImages( config , )
    %ImportImage - Imports all images in Matlab
    %We get a set of roughly 300 individual images per measurements
    %These images are kept in one structure (importImage)

    cd(config.splitCorrelationCd);                           % Sets image folder
    directory0 = dir('*cam0*.tiff');                        % Labels all the tiffFiles with cam0 in the current directory
    directory1 = dir('*cam1*.tiff');                        % Labels all the tiffFiles with cam0 in the current directory
    numFiles0 = length(directory0);                         % Number of individual image
    numFiles1 = length(directory0);
    importImages.sum0=0;
    importImages.sum1=0;
    
    for k = 1:numFiles0
        importImages.image0(:,:,k)=imread(directory0(k).name);             %Import the images from cam 0
        importImages.sum0=importImages.sum0+double(importImages.image0(:,:,k));
    end
    
    for j = 1:numFiles1
        importImages.image1(:,:,j)=imread(directory1(j).name);             %Import the images from cam 1
        importImages.sum1=importImages.sum1+double(importImages.image1(:,:,j));
    end
        
    cd(config.matlabCd)                                  %Resets the cd to the matlab script location
end