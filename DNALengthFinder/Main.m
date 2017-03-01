clear all; clc; close all

config = Config();

%% Initialize ouput arrays

loadImgOutput=cell(config.NumberOfMeasurements,1);
filtImgOutput1=cell(config.NumberOfMeasurements,1);
filtImgOutput2=cell(config.NumberOfMeasurements,1);
beamshapeCorrectionOutput=cell(config.NumberOfMeasurements,1);

%%
tic
parfor i=1:config.NumberOfMeasurements
    loadImgOutput{i,1}=loadImg(config.OutputCd,config.MatlabCd,i);                       %Loads images
    [filtImgOutput1{i,1}, filtImgOutput2{i,1}]=filtImg(loadImgOutput{i,1},3); 
    beamshapeCorrectionOutput{i,1}=beamshapeCorrection(loadImgOutput{i,1});
    [filtImgOutput{i,1}, filtImgOutput{i,2}]=filtImg(loadImgOutput{i,1},3);         
    spotFinder(d(i));
    dnaFinder(e(i));
    imageCorrelation(f);
    visualization(loadImgOutput, config.OutputVelocity, i ,config.Cmap);
end
toc