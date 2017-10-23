clear all; clc; close all;

user = 'tudelft';
config = struct();
config = Config( config, user);

%% Import images

%importImages = ImportImages( config);
load( strcat(config.referenceSetSaveCd, 'importImagesReference.mat'));
save( sprintf('%simportImagesReference.mat', config.referenceSetSaveCd), 'importImages');

%% Create and save the reference sets

% Reference Set 1
referenceSets{1} = CreateReferenceSet1( config );

% Reference Set 2
referenceSets{2} = CreateReferenceSet2( config, importImages.referenceSet2);

% Reference Set 3
referenceSets{3} = CreateReferenceSet3( config );
referenceSets{3}.dnaRoi{1} = referenceSets{1}.dnaRoi{1};

%%
% Reference Set4
referenceSets{4} = CreateReferenceSet4( config );

save( sprintf('%sReferenceSets.mat', config.referenceSetSaveCd), 'referenceSets' );


%%

