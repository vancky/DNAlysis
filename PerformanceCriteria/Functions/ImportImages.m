function [ config, output] = ImportImages( config )
    %IMPORTIMAGES Summary of this function goes here
    %   Detailed explanation goes here

    load( config.matFileCdComplete);
    config.numReferenceSets = length( referenceSets);
    
    output = referenceSets;
end

