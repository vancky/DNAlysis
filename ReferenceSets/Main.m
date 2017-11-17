clear all; clc; close all;

user = 'home';
config = struct();
config = Config( config, user);

%% Import images

importImages = ImportImages( config);

%% Create and save the reference sets

% Reference Set 1
referenceSets{1} = CreateReferenceSet1( config );

% Reference Set 2
referenceSets{2} = CreateReferenceSet2( config, importImages.referenceSet2);
%%
% Reference Set 3
referenceSets{3} = CreateReferenceSet3( config );
referenceSets{3}.dnaRoi{1} = referenceSets{1}.dnaRoi{1};

%%
% Reference Set4
%referenceSets{4} = CreateReferenceSet4( config );

%%

save( config.referenceCd, 'referenceSets' );
fprintf( sprintf('%s%s\n', 'Reference sets have been saved to ', config.referenceCd ))

%%

figure; 
imshow( referenceSets{1}.helicaseImage{1}, []); axis equal; axis tight;  hcb= colorbar; set(hcb,'YTick',[]); 
%PlotCenters( referenceSets{1}.roiCenters{1}, 10)
pause(0.5)
figure;
imshow( referenceSets{2}.helicaseImage{1} , []); axis equal; axis tight;  hcb= colorbar; set(hcb,'YTick',[]); 
%PlotCenters( referenceSets{2}.roiCenters{1}, 10)
pause(0.5)
figure;
imshow( referenceSets{3}.helicaseImage{1}, []); axis equal; axis tight;  hcb= colorbar; set(hcb,'YTick',[]); 
%PlotCenters( referenceSets{3}.roiCenters{1}, 10)
        

