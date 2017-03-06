clear all; clc; close all

% The Config.m file contains all parameters which you can adjust.
% Please open it and set the correct directories, parameters, etc.

config=Config();                                    
config=ConfigFunction(config); 
loadBeamshape=LoadBeamshape(config);

%%

tic
parfor i=1:config.NumberOfMeasurements
    loadImgOutput{i,1}=LoadImg(config.OutputCd,config.MatlabCd,i);                    %Loads images
    filterImage{i,1}=FilterImage(loadImgOutput{i,1},r);                                 %Filter the images
    beamshapeCorrectionOutput{i,1}=BeamshapeCorrection(loadImgOutput{i,1});           %Correct for beamshape
    spotFinderOutput{i,1}=SpotFinder2(filtImgOutput{i,1}, treshold);                             %Finds all bright fluorescent spots 
    [dnaFinderOutput{i,1} dnaFinderBoxes{i,1}]=DnaFinder(spotFinderOutput{i,1});      %Look for groups of fluorescent spots, these are the DNA strands
end
toc
%% Visualization test, delete later!
for i=1:3 %config.numberOfMeasurements
    figure
    subplot(2,2,1), imshow(loadImage{i,1}.image,[]), title('Original Image')
    subplot(2,2,2), imshow(filterImage{i,1}.outputImage,[]), title('Filtered Image')
    subplot(2,2,3), imshow(spotFinder{i,1}.logic,[]), title('spotfinder')
    subplot(2,2,4), imshow(dnaFinder{i,1}.dna,[]), title('DNA finder')
end

%%  DNA boxes Visualisation, DELETE LATER!
for i=1:3 %config.numberOfMeasurements
    figure 
    subplot(1,2,2), imshow(filterImage{i,1}.outputImage,[]), title('Filtered Image with found DNA')
    for j=1:length(dnaFinder{i,1}.goodBoxes)
        rectangle('position',dnaFinder{i,1}.goodBoxes(j).BoundingBox,'EdgeColor','r')
    end
    subplot(1,2,1), imshow(loadImage{i,1}.image,[]), title('Original Image')
    for j=1:length(dnaFinder{i,1}.goodBoxes)
        rectangle('position',dnaFinder{i,1}.goodBoxes(j).BoundingBox,'EdgeColor','r')
    end
end

%%
parfor j=1:config.NumberOfMeasurements
    visualization(loadImgOutput, config.OutputVelocity, j ,config.Cmap);                         %Visualize the results   
end

%% Remove the added paths for completeness sake

rmpath ./Functions
rmpath ./Functions/Util
rmpath ./Functions/Filters
rmpath ./Functions/gaussmlev2