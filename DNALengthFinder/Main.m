clear all; clc; close all

% The Config.m file contains all parameters which you can adjust.
% Please open it and set the correct directories, parameters, etc.

config=Config();                                    
config=ConfigFunction(config); 
loadBeamshape=LoadBeamshape(config);
%%
tic
parfor i=1:config.numberOfMeasurements
    %loadImage{i,1}=LoadImage(config, i);                       %Loads images
    %beamshapeCorrection{i,1}=BeamshapeCorrection( loadBeamshape , loadImage{i,1} );
    filterImage{i,1}=FilterImage(beamshapeCorrection{i,1},config); 
    %spotFinder(d(i));
    %dnaFinder(e(i));
    %imageCorrelation(f);
    
end
toc
%%
for i=1:config.numberOfMeasurements
   visualization(loadImgOutput, config.OutputVelocity, i ,config.Cmap);
end