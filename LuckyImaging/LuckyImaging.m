clear all; clc; close all

% The Config.m file contains all parameters which you can adjust.
% Please open it and set the correct directories, parameters, etc.
config=struct();            
config=Config(config);
config=ConfigFunction(config);

%% Import Images
fprintf('Importing the images. \n')

%loadBeamshape=LoadBeamshape(config);       We have no beamshape at the
%moment, thus skip.

importImages=ImportImages(config);
config.numStacks=importImages.numFiles/config.stackSize;        % determine the amount of stacks to analyse, has to be an iteger!
fprintf('Images have been imported. \n')
%% Stack images and beamshape correction
fprintf('Stacking the images. \n');

stackImages=StackImages(importImages, config);

fprintf('Images have been stacked. \n')
fprintf('Apply a rolling ball filter to the images. \n');

for i=1:config.numStacks
    rollingBallFilter.image{i}=RollingBallFilter(stackImages.image{i},30);
end

%IN THEORY WE DON'T NEED TO STACK IMAGES! SO WE SKIP THE FUNCTION FOR NOW.

fprintf('Rolling ball filter has been applied. \n');
%%  CLEAN Algorithm and lucky Imaging for each individual image
tic
for i=1:config.numStacks
    fprintf('Applying clean algorithm for each image. Progress %d/%d.\n', i, config.numStacks);
    clean{i}=Clean(rollingBallFilter.image{i}, config ,i);
end
toc

%% Lucky Algorithm
fprintf('applying lucky algorithm')
tic
lucky=Lucky(clean, config);
toc
fprintf('All set! \n')
%% Stack all the images

finalImage=0;

for i=1:config.numStacks
    finalImage=finalImage+lucky{i}.image;
end
    

%% Visualisation

Visualisation(rollingBallFilter,clean,config)
figure; imshow(finalImage,[])
