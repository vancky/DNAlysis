function [ output ] = loadImg( configOutputCd, matlabCd ,i )
%Image Loader - Imports all images into Matlab
%   Detailed explanation goes here

sumData=0;                          %Initiate the sumData for the for loop
        cd(configOutputCd{i});                                %sets the subfolder to import data from
        directory = dir('*cam0*.tiff');                      %Labels all the tiffFiles with cam0 in the current directory
        numFiles = length(directory);                 %Number of individual images
        
        for k = 1:numFiles  
            sumData=sumData+imread(directory(k).name);    %Sums all the data files into the file
        end
        output=sumData./length(directory);
cd(matlabCd{1})                                   %Resets the cd to the matlab script location
end