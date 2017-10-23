clear all; close all; clc; 

% Choose a user, tudelft or home
user = 'tudelft';
config = struct();
config = Config( config, user);

%% Import Images

fprintf('This section imports all the relevant images.\n')
[ config, importImages] = ImportImages(config);

%% Analysis

fprintf('This section performs the Analysis.\n')
analysis = Analysis( config, importImages);

%%
% Compute the performance criteria for the helicases
for jj = 1:config.numReferenceSets
    if ~isempty( output.helicaseLocation{jj}{1})       
        output.helicasePerformance{jj} = PerformanceHelicases( referenceSets{jj}.roiCenters, output.helicaseLocation{jj});
    else
        output.helicasePerformance{jj} = {[]};
    end
end

% Compute the performance criteria for the dna
for kk = 1:config.numReferenceSets
    if ~isempty( output.dnaRoiEstimated{kk}{1})
        output.dnaPerformance{kk} = PerformanceDna( referenceSets{kk}.dnaRoi, output.dnaRoiEstimated{kk});
    else
        output.dnaPerformance{kk} = {[]};
    end
end

output.helicasePerformance;

fprintf('Results of the Performance Criteria\n')
for ll = 1:3
    fprintf( '\nResults for reference set %i\n\n', ll)
    fprintf( 'The helicase tracking succes is %.2f\n', output.helicasePerformance{ll}.trackingSuccesAvg);
    fprintf( 'The helicase tracking fraction is %.2f\n', output.helicasePerformance{ll}.trackingFractionAvg);
    fprintf( 'The dna tracking succes is %.2f\n', output.dnaPerformance{ll}.trackingSuccesAvg);
    fprintf( 'The dna tracking fraction is %.2f\n', output.dnaPerformance{ll}.trackingFractionAvg);
end
