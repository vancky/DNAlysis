clear all; clc; close all;

config=struct();
config=Config(config);

%% Create and save the reference sets


referenceSet1 = CreateReferenceSet1( config );
save( strcat(config.referenceSetSaveCd, 'ReferenceSet1.mat') , 'referenceSet1');

% referenceSet2 = CreateReferenceSet2( config );
% SaveReferenceSet2( referenceSet2 )
% referenceSet3 = CreateReferenceSet3( config );
% SaveReferenceSet3( referenceSet3 )
% referenceSet4 = CreateReferenceSet4( config );
% SaveReferenceSet4( referenceSet4 )
