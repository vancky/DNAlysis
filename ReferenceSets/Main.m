clear all; clc; close all;

config = struct();
config = Config(config);

%% Import images

importImages = ImportImages( config);
%load( strcat(config.referenceSetSaveCd, 'importImagesReference.mat'));
save( sprintf('%simportImagesReference.mat', config.referenceSetSaveCd), 'importImages');

%% Create and save the reference sets

% Reference Set 1
referenceSets{1} = CreateReferenceSet1( config, importImages.referenceSet1 );

% Reference Set 2
referenceSets{2} = CreateReferenceSet2( config, importImages.referenceSet2 );

% Reference Set 3
referenceSets{3} = CreateReferenceSet3( config );

% Reference Set4
referenceSets{4} = CreateReferenceSet4( config );

save( sprintf('%sReferenceSets.mat', config.referenceSetSaveCd), 'referenceSets' );

