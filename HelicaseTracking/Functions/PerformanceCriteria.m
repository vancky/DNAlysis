function [ output ] = PerformanceCriteria( config )
    % Performance Criteria - Computes the performance criteria of the 
    % algorithm by evaluating the reference sets.
    % Detailed explanation goes here

   % Load the reference sets
   load( sprintf('%sReferenceSets.mat',  config.referenceSetCd));
   config.numReferenceSets = length( referenceSets);
   
   for ii = 1:config.numReferenceSets
       ii
       analysis = Analysis( config, referenceSets{ii}, 'ReferenceSets');
       output.helicaseLocation{ii} = analysis.helicaseLocation;
   end
   
   
   
   
   for jj =1:config.numReferenceSets
       if ~isempty( output.helicaseLocation{jj}{1})       
           output.helicasePerformance{jj} = PerformanceHelicases( referenceSets{jj}.roiCenters, output.helicaseLocation{jj});
       else
           output.helicasePerformance{jj} = {[]};
       end
   end
   
 
   output.helicasePerformance;
   
   fprintf('Results of the Performance Criteria\n')
   for kk = 1:3
      fprintf( '\nResults for reference set %i\n\n', kk)
      fprintf( 'The tracking fraction is %.2f\n', output.helicasePerformance{kk}.trackingFractionAvg)
      fprintf( 'The tracking Succes is %.2f\n', output.helicasePerformance{kk}.trackingSuccesAvg)
   end
    
end

