clear all; clc; close all;

config=struct();
config=Config(config);


%% Import Images

fprintf('Importing Images.\n')
importedSplitCorrelationImages=     ImportOneCamera( config.splitCorrelationCd , 'stack' );
%%
importedCameraCorrelationImages =   ImportTwoCameras( config.cameraCorrelationCd );
importedNoiseImages =               ImportTwoCameras( config.noiseCd );
importedBeamshapeImages =           ImportTwoCameras( config.beamshapeCd);
%%

importedDnaImages =                 ImportOneCamera( config.dnaCd , 'stack' );
importedHelicaseImages =            ImportOneCamera( config.helicaseCd , 'all' );
%save('.\MatFiles\CleanTests\HelicaseImages' , 'importedHelicaseImages')
fprintf('Images Imported.\n')
%% Generate the crop Coordinates from the beamshape image
config.cropCoordinates = GenerateCropCoordinates( importedBeamshapeImages{1}.cam0);

%% 1. Beamshape Correction

[beamshape , beamshape.test] = GenerateBeamshape( config, importedBeamshapeImages{1} ); 

%filterImages=FilterImages(config, beamshapeCorrection.image);

%% Correlations

%DisplayShotNoise( config, importedNoiseImages);
%splitCorrelation  = SplitCorrelation(config, importedSplitCorrelationImages{1} );
%cameraCorrelation = CameraCorrelation( config, importedCameraCorrelationImages );
matchDnaHelicase  = MatchDnaHelicase( config, splitCorrelation , importedHelicaseImages{1} , importedDnaImages{1} , beamshape );

%% Tests with the clean algorith
tic
luckyPre = LuckyPreProcess( config , importedHelicaseImages{1});
toc
%%
tic

cleanImage = 0;
% maybe get a threshold per image?
cleanThreshold = 1.5*luckyPre.thresholdFinder.threshold; 
numStacks = luckyPre.numStacks;
parfor i=1:5
    fprintf( 'clean Progress %i/%i.\n', i , numStacks)
    [ clean{i} ] = Clean( config , luckyPre.stackHelicases(:,:,i) , cleanThreshold ); 
    cleanImage = cleanImage+clean{i}.newImage;
end
cleanImage = cleanImage/numStacks;
toc

figure; 
subplot(1,2,1); imshow( luckyPre.originalImage ,[]); title('stacking of individual images')
subplot(1,2,2); imshow( cleanImage ,[]); title('after clean algorithm')
%%
%  lucky imaging
tic
luckyImage=0;
parfor i=1:numStacks
    lucky{i} = Lucky( config , clean{i} );
    luckyImage = luckyImage+lucky{i}.luckyImage;
end
luckyImage = luckyImage/numStacks;
toc

figure; 
subplot(1,2,1); imshow( cleanImage ,[]); title('Clean Algorithm')
subplot(1,2,2); imshow( luckyImage ,[]); title('Lucky Algorithm')