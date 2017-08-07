function [ output ] = CreateReferenceSet3( config )
    % Create Reference Set 3
    % Create the static simulated images at different SNR ratios.
   
    fprintf('Simulating the helicase images for reference set 3.\n')
    output.helicaseImage = CreateHelicaseImage3(config);
    fprintf('The helicase images for reference set 3 have been simulated.\n')
    
    fprintf('Simulating the dna images for reference set 3.\n')
    output.dnaImage = CreateDnaImage3(config);
    fprintf('The dna images for reference set 3 have been simulated.\n')
end

