clear all; clc; close all;

config=struct();
config=Config(config);

%% Import Images

fprintf('Importing Images.\n')
importedSplitCorrelationImages=     ImportOneCamera( config.splitCorrelationCd , 'stack' );
fprintf('Images Imported.\n')


%% Create the reference sets

referenceSet1 = CreateReferenceSet1();
referenceSet2 = CreateReferenceSet2();
referenceSet3 = CreateReferenceSet3();
referenceSet4 = CreateReferenceSet3();
