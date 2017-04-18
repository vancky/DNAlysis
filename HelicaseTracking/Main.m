clear all; clc; close all;

config=struct();
config=Config(config);


%% Import Images
tic
fprintf('Importing Images.\n')
importedSplitCorrelationImages=     ImportOneCamera( config.splitCorrelationCd );
importedCameraCorrelationImages =   ImportTwoCameras( config.cameraCorrelationCd );
importedNoiseImages =               ImportTwoCameras( config.noiseCd );
importedBeamshapeImages =           ImportTwoCameras( config.beamshapeCd);
importedDnaImages =                 ImportOneCamera( config.dnaCd );
importedHelicaseImages =            ImportOneCamera( config.helicaseCd );
toc
fprintf('Images Imported.\n')
%% Generate the crop Coordinates from the beamshape image
config.cropCoordinates = GenerateCropCoordinates( importedBeamshapeImages{1}.cam0);

%% 1. Beamshape Correction

[beamshape , beamshape.test] = GenerateBeamshape( config, importedBeamshapeImages{1} ); 

%filterImages=FilterImages(config, beamshapeCorrection.image);

%% Shot Noise

DisplayShotNoise( config, importedNoiseImages);

%% 2. Split Image Correlation (cam0)

splitCorrelation=SplitCorrelation(config, beamshapeCorrection.cam0 );

%% Cam 0/1 correlation
cameraCorrelation=CameraCorrelation( config, importedCameraCorrelationImages );

%% Match the helicases with DNA

matchDnaHelicase=MatchDnaHelicase( config, splitCorrelation , importedHelicaseImages{1} , importedDnaImages{1} , beamshape );
