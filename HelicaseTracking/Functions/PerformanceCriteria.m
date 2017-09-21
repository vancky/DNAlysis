function [ output ] = PerformanceCriteria( config )
    % Performance Criteria - Computes the performance criteria of the 
    % algorithm by evaluating the reference sets.
    % Detailed explanation goes here

   % Load the reference sets
   load( sprintf('%sReferenceSets.mat',  config.referenceSetCd));
   config.numReferenceSets = length( referenceSets);
   
   for ii = 1: config.numReferenceSets
       analysis = Analysis( config, referenceSets{ii}, 'ReferenceSets');
   end
   
   output.helicaseLocation = analysis.helicaseLocation;

   %output = referenceSets;
    
end

