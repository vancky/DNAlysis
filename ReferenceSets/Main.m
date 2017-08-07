clear all; clc; close all;

config=struct();
config=Config(config);

%% Create and save the reference sets

%Reference Set 1
referenceSet1 = CreateReferenceSet1( config );
save( strcat(config.referenceSetSaveCd, 'ReferenceSet1.mat') , 'referenceSet1');
% Reference Set 2
referenceSet2 = CreateReferenceSet2( config );
save( strcat(config.referenceSetSaveCd, 'ReferenceSet2.mat') , 'referenceSet2');
% Reference Set 3
%%
referenceSet3 = CreateReferenceSet3( config );
save( strcat(config.referenceSetSaveCd, 'ReferenceSet3.mat') , 'referenceSet3');
%%
% Reference Set4
referenceSet4 = CreateReferenceSet4( config );
save( strcat(config.referenceSetSaveCd, 'ReferenceSet4.mat') , 'referenceSet4');

%% 