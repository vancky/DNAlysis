clear all; clc; close all

Config

%% Make sure we can use the functions
addpath ./Functions/Util
addpath ./Functions
addpath ./Functions/gaussmlev2

%%
r=3;                    % Rolling ball radius
tic
parfor i=1:config.NumberOfMeasurements
    loadImgOutput{i,1}=LoadImg(config.OutputCd,config.MatlabCd,i);                       %Loads images
    filtImgOutput{i,1}=FiltImg(loadImgOutput{i,1},r); 
    beamshapeCorrectionOutput{i,1}=BeamshapeCorrection(loadImgOutput{i,1});
    spotFinderOutput{i,1}=SpotFinder(filtImgOutput{i,1});
end
toc
%% Test to visualize the filters
for i=1:config.NumberOfMeasurements
    figure
    subplot(1,2,1), imshow(loadImgOutput{i,1},[]), title('Original Image')
    subplot(1,2,2), imshow(filtImgOutput{i,1},[]), title('Filtered Image')
end
%%
for i=1:9
    [logicOutput{i,1} , spotFinderOutput{i,1}]=SpotFinder(filtImgOutput{i,1});                        %Finds all bright fluorescent spots 
    figure
    subplot(1,2,1), imshow(filtImgOutput{i,1},[]), title('Filtered Image')
    subplot(1,2,2), imshow(logicOutput{i,1},[]), title('spotfinder')
end

%%
parfor i=1:10                                  
dnaFinder(e(i));                                      %Look for groups of fluorescent spots, these are the DNA strands
imageCorrelation(f);                                  %Correlate the analysed results from different flow velocities
end
                    
%%
parfor j=1:config.NumberOfMeasurements
    visualization(loadImgOutput, config.OutputVelocity, j ,config.Cmap);                         %Visualize the results   
end

%% Remove the added paths for completeness sake
rmpath ./Functions/Util
rmpath ./Functions
