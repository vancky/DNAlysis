clear all; clc; close all;

config=struct();
config=Config(config);

%% Import images

importImages.beadImage = ImportOneCamera( config.referenceSet1Cd , 'stack' );
importImages.referenceSet2.helicaseImages = ImportOneCamera( config.referenceSet2HelicaseCd, 'stack' );
importImages.referenceSet2.dnaImages =    ImportOneCamera( config.referenceSet2DnaCd, 'stack' );

save( strcat(config.referenceSetSaveCd, 'importImagesReference.mat') , 'importImages');
%% Create and save the reference sets

%Reference Set 1
referenceSet1 = CreateReferenceSet1( config );
save( strcat(config.referenceSetSaveCd, 'ReferenceSet1.mat') , 'referenceSet1');
%%
% Reference Set 2
referenceSet2 = CreateReferenceSet2( config );
save( strcat(config.referenceSetSaveCd, 'ReferenceSet2.mat') , 'referenceSet2');
%%
% Reference Set 3
referenceSet3 = CreateReferenceSet3( config );
save( strcat(config.referenceSetSaveCd, 'ReferenceSet3.mat') , 'referenceSet3');
%%
% Reference Set4
referenceSet4 = CreateReferenceSet4( config );
save( strcat(config.referenceSetSaveCd, 'ReferenceSet4.mat') , 'referenceSet4');
