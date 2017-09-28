function [ output ] = PerformanceCriteria( config )
    % Performance Criteria - Computes the performance criteria of the 
    % algorithm by evaluating the reference sets.
    % Detailed explanation goes here

    % Load the reference sets
    load( sprintf('%sReferenceSets.mat',  config.referenceSetCd));
    config.numReferenceSets = length( referenceSets);
   
    for ii = 1:config.numReferenceSets
        analysis = Analysis( config, referenceSets{ii}, 'ReferenceSets');
        output.helicaseLocation{ii} = analysis.helicaseLocation;
        output.dnaRoiEstimated{ii} = analysis.dnaRoi;
    end
    
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
    
end

