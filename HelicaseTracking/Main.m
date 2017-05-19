clear all; clc; close all;

config=struct();
config=Config(config);


%% Import Images

fprintf('Importing Images.\n')
importedSplitCorrelationImages=     ImportOneCamera( config.splitCorrelationCd , 'stack' );
%
importedCameraCorrelationImages =   ImportTwoCameras( config.cameraCorrelationCd );
importedNoiseImages =               ImportTwoCameras( config.noiseCd );
importedBeamshapeImages =           ImportTwoCameras( config.beamshapeCd);
%
importedDnaImages =                 ImportOneCamera( config.dnaCd , 'stack' );
importedHelicaseImages =            ImportOneCamera( config.helicaseCd , 'all' );
%save('.\MatFiles\CleanTests\HelicaseImages' , 'importedHelicaseImages')
fprintf('Images Imported.\n')
%% Generate the crop Coordinates from the beamshape image
config.cropCoordinates = GenerateCropCoordinates( importedHelicaseImages{1}(:,:,1),[]);

%% 1. Beamshape Correction

%[beamshape , beamshape.test] = GenerateBeamshape( config, importedBeamshapeImages{1} ); 

%filterImages=FilterImages(config, beamshapeCorrection.image);

%% Correlations

%DisplayShotNoise( config, importedNoiseImages);
splitCorrelation  = SplitCorrelation( config, importedSplitCorrelationImages{1} );
config.splitCorrelation = [ splitCorrelation.rowCorrection , splitCorrelation.colCorrection ];
%cameraCorrelation = CameraCorrelation( config, importedCameraCorrelationImages );
%% Tests with the clean algorithm
tic
luckyPre = LuckyPreProcess( config , importedHelicaseImages{1});
toc
%%
for i=1:luckyPre.numStacks
    spotFinder{i} = SpotFinder( config , luckyPre.stackHelicases(:,:,i));
    numSpots(i)=length(spotFinder{i}.circle);
end
figure;
plot(numSpots)
title('Number of spots per minute, washing occurs from frame 20 ')
xlabel('Time (frames)')
ylabel('Number of spots')
grid

%%
matchDnaHelicase  = MatchDnaHelicase( config, luckyPre.originalImage , importedDnaImages{1}  );


%%
tic

cleanImage = 0;
% maybe get a threshold per image?
cleanThreshold = 1.5*luckyPre.thresholdFinder.threshold; 
numStacks = luckyPre.numStacks;
parfor i=1:numStacks
    fprintf( 'clean Progress %i/%i.\n', i , numStacks)
    [ clean{i} ] = Clean( config , luckyPre.stackHelicases(:,:,i) , cleanThreshold ); 
    cleanImage = cleanImage+clean{i}.newImage;
end
cleanImage = cleanImage/numStacks;
toc
%%
figure; 
subplot(1,2,1); imshow( RollingBallFilter(luckyPre.originalImage,30) ,[0 200]); title('stacking of individual images'); colorbar
subplot(1,2,2); imshow( cleanImage ,[0 200]); title('after clean algorithm'); colorbar
%%
%  lucky imaging
tic
luckyImage=0;
for i=1:numStacks
    lucky{i} = Lucky( config , clean{i} );
    luckyImage = luckyImage+lucky{i}.luckyImage;
end
luckyImage = luckyImage/numStacks;
toc

figure; 
subplot(1,2,1); imshow( RollingBallFilter(luckyPre.originalImage,30) ,[0 200 ]); title('Stacking of Individual Images'); colorbar
subplot(1,2,2); imshow( luckyImage ,[ 0 200]); title('Lucky Algorithm'); colorbar