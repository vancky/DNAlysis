clear all; clc; close all

% The Config.m file contains all parameters which you can adjust.
% Please open it and set the correct directories, parameters, etc.
config=struct();            
config=Config(config);
config=ConfigFunction(config);

%% Import Images

importImages=ImportImages(config);

%%  CLEAN Algorithm

%for i=1:importImages.numFiles
    brightFinder=BrightFinder(importImages);
%end

%   fitGaussian=FitGaussian();
%   generateGaussianMask=GenerateGaussianMask();   
%end





%%

