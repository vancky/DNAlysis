function [ output ] = PostProcess( config, importImages, analysis )
    %POSTPROCESS Summary of this function goes here
    %   Detailed explanation goes here

    % Compute the performance criteria for the helicases
    for jj = 1:config.numReferenceSets
        if ~isempty( analysis.helicaseLocation{jj}{1})       
            output.helicasePerformance{jj} = PerformanceHelicases( importImages{jj}.roiCenters, analysis.helicaseLocation{jj});
        else
            output.helicasePerformance{jj} = {[]};
        end
    end

    % Compute the performance criteria for the dna
    for kk = 1:config.numReferenceSets
        if ~isempty( analysis.dnaRoiEstimated{kk}{1})
            output.dnaPerformance{kk} = PerformanceDna( importImages{kk}.dnaRoi, analysis.dnaRoiEstimated{kk});
        else
            output.dnaPerformance{kk} = {[]};
        end
    end

    fprintf('Results of the Performance Criteria\n')
    for ll = 1:3
        fprintf( '\nResults for reference set %i\n\n', ll)
        fprintf( 'The helicase tracking succes is %.2f\n', output.helicasePerformance{ll}.trackingSuccesAvg);
        fprintf( 'The helicase overtracking error is %.2f\n', output.helicasePerformance{ll}.trackingErrorAvg);
        fprintf( 'The dna tracking succes is %.2f\n', output.dnaPerformance{ll}.trackingSuccesAvg);
        fprintf( 'The dna overtracking error is %.2f\n', output.dnaPerformance{ll}.trackingErrorAvg);
    end


end

