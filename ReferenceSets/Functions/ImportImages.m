function [ output ] = ImportImages( config )
    % Import Images - Imports all relevant images
    
    fprintf('Importing the bead image for reference set 1.\n')
    output.referenceSet1.helicase = ImportOneCamera( config.referenceSet1Cd , 'stack' );
    fprintf('The bead image for reference set 1 has been imported.\n')
    
    fprintf('Importing the dna image for reference set 1.\n')
    output.referenceSet1.dna = [];
    fprintf('The dna image for reference set 1 has been imported.\n')
    
    fprintf('Importing the helicase Images for reference set 2.\n')
    output.referenceSet2.helicase = ImportOneCamera( config.referenceSet2HelicaseCd, 'stack' );
    fprintf('The helicase images for reference set 2 have been imported.\n')
        
    fprintf('Importing the dna Images for reference set 2.\n')
    output.referenceSet2.dna = ImportOneCamera( config.referenceSet2DnaCd, 'stack' );
    fprintf('The dna images for reference set 2 have been imported.\n')
    
end

