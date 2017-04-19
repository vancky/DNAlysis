clear all; clc; close all;

config=struct();
config=Config(config);


%% Import Images

fprintf('Importing Images.\n')
importedSplitCorrelationImages=     ImportOneCamera( config.splitCorrelationCd , 'stack' );
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

%% Correlations

%DisplayShotNoise( config, importedNoiseImages);
splitCorrelation=SplitCorrelation(config, beamshapeCorrection.cam0 );
cameraCorrelation=CameraCorrelation( config, importedCameraCorrelationImages );
matchDnaHelicase=MatchDnaHelicase( config, splitCorrelation , importedHelicaseImages{1} , importedDnaImages{1} , beamshape );

%% Tests with the clean algorith

N=size( importedHelicaseImages{1} , 3 );
originalImage=0;
for i=1:N
    crop = CropSplitImage( config , importedHelicaseImages{1}(:,:,i) );
    correctionSmooth = BallSmooth( helicases(:,:,i) , 30);
    correction = max(correctionSmooth(:))./correctionSmooth;
    helicases(:,:,i)= correction.*crop.leftImage;
    originalImage=originalImage+helicases(:,:,i);
end
originalImage=originalImage/300;

%% Stack images to better see helicases

stackSize = 10;
numStacks = N/stackSize;
for i=1:numStacks
    for k=1:stackSize
        stackHelicases(:,:,i)=helicases(:,:,k+(i-1)*stackSize);
        stackHelicases(:,:,i)=BackgroundFilter(stackHelicases(:,:,i));
    end
end



%% Clean and lucky imaging
tic
thresholdFinder= ThresholdFinder(originalImage);
%%
parfor i=1:1
    [ clean{i} , test ] = Clean( config , stackHelicases(:,:,i) , thresholdFinder.threshold ); 
end
toc
%%
finalImage=0;

for i=1:N
   finalImage=finalImage+clean{i}.newImage;
end

figure; 
subplot(1,2,1); imshow( originalImage ,[]); title('stacking of individual images')
subplot(1,2,2); imshow( finalImage ,[]); title('after clean algorithm')
