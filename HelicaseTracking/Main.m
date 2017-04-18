clear all; clc; close all;

config=struct();
config=Config(config);


%% Import Images

fprintf('Importing Images.\n')
importedSplitCorrelationImages=     ImportOneCamera( config.splitCorrelationCd );
importedCameraCorrelationImages =   ImportTwoCameras( config.cameraCorrelationCd );
importedNoiseImages =               ImportTwoCameras( config.noiseCd );
importedBeamshapeImages =           ImportTwoCameras( config.beamshapeCd);
importedDnaImages =                 ImportOneCamera( config.dnaCd , 'stack' );
%%
importedHelicaseImages =            ImportOneCamera( config.helicaseCd , 'all' );
%save('.\MatFiles\CleanTests\HelicaseImages' , 'importedHelicaseImages')
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

%% Tests with the clean algorith

load('.\MatFiles\CleanTests\HelicaseImages.mat')
%%
[ clean , test ] = Clean( config , importedHelicaseImages{1}(:,:,1) );



