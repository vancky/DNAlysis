clear all; clc; close all

% The Config.m file contains all parameters which you can adjust.
% Please open it and set the correct directories, parameters, etc.

config=Config();                                    
config=ConfigFunction(config); 

%% Make sure we can use the functions
addpath ./Functions
addpath ./Functions/Util
addpath ./Functions/Filters
addpath ./Functions/gaussmlev2

%%

tic
parfor i=1:config.NumberOfMeasurements
    loadImgOutput{i,1}=LoadImg(config.OutputCd,config.MatlabCd,i);                    %Loads images
    %filterImage{i,1}=FilterImage(loadImgOutput{i,1},r);                                 %Filter the images
    %beamshapeCorrectionOutput{i,1}=BeamshapeCorrection(loadImgOutput{i,1});           %Correct for beamshape
    %spotFinderOutput{i,1}=SpotFinder2(filtImgOutput{i,1}, treshold);                             %Finds all bright fluorescent spots 
    %[dnaFinderOutput{i,1} dnaFinderBoxes{i,1}]=DnaFinder(spotFinderOutput{i,1});      %Look for groups of fluorescent spots, these are the DNA strands
end
toc
%% Test to visualize the filters
for i=1:config.NumberOfMeasurements
    figure
    subplot(2,2,1), imshow(loadImgOutput{i,1},[]), title('Original Image')
    subplot(2,2,2), imshow(filterImage{i,1}.outputImage,[]), title('Filtered Image')
    subplot(2,2,3), imshow(spotFinderOutput{i,1},[]), title('spotfinder')
    subplot(2,2,4), imshow(dnaFinderOutput{i,1},[]), title('DNA finder')
end
%%
for i=1:config.NumberOfMeasurements
    [spotFinderOutput{i,1}]=SpotFinder2(filterImage{i,1}.outputImage.outputImage, treshold);                        
    figure 
    [dnaFinderOutput{i,1} dnaFinderBoxes{i,1}]=DnaFinder(spotFinderOutput{i,1}); 
    subplot(1,2,2), imshow(filterImage{i,1}.outputImage.outputImage,[]), title('Filtered Image with found DNA')
    for j=1:length(dnaFinderBoxes{i})
        rectangle('position',dnaFinderBoxes{i}(j).BoundingBox,'EdgeColor','r')
    end
    subplot(1,2,1), imshow(loadImgOutput{i,1},[]), title('Original Image')
    for j=1:length(dnaFinderBoxes{i})
        rectangle('position',dnaFinderBoxes{i}(j).BoundingBox,'EdgeColor','r')
    end
end

%% image correlation
                                               
imageCorrelation=ImageCorrelation(dnaFinderBoxes, config.NumberOfMeasurements, config.OutputVelocity);                                 %Correlate the analysed results from different flow velocities
                    
%%
parfor j=1:config.NumberOfMeasurements
    visualization(loadImgOutput, config.OutputVelocity, j ,config.Cmap);                         %Visualize the results   
end

%% Remove the added paths for completeness sake

rmpath ./Functions
rmpath ./Functions/Util
rmpath ./Functions/Filters
rmpath ./Functions/gaussmlev2