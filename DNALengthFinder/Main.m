clear all; clc; close all

% The Config.m file contains all parameters which you can adjust.
% Please open it and set the correct directories, parameters, etc.

config=Config();                                    
config=ConfigFunction(config); 

%% Load the Images into Matlab
loadBeamshape=LoadBeamshape(config);
parfor i=1:config.numberofMeasurements
    loadImage{i,1}=LoadImage(config, i);
end

%% Perform the Analysis

parfor i=1:config.numberOfMeasurements
    beamshapeCorrection{i,1}=BeamshapeCorrection( loadBeamshape , loadImage{i,1} );
    filterImage{i,1}=FilterImage(beamshapeCorrection{i,1},config); 
    spotFinder{i,1}=SpotFinder(filterImage{i,1}.outputImage, config);
    dnaFinder{i,1}=DnaFinder(spotFinder{i,1}.logic, config);
end
imageCorrelation=ImageCorrelation(dnaFinder, config.numberOfMeasurements, config.outputVelocity);

%% Visualise the results

for i=1:config.numberOfMeasurements
   visualization(loadImgOutput, config.OutputVelocity, i ,config.Cmap);
end
