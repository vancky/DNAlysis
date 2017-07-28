function [ output ] = CreateReferenceSet2( config )
    % Create Reference Set 2
    % Create the helicase and dna image for reference set 2
    
    fprintf('Importing the helicase Images for reference set 2.\n')
    helicaseImages = ImportOneCamera( config.referenceSet2HelicaseCd, 'stack' );
    fprintf('The helicase images for reference set 2 have been imported.\n')
    
    fprintf('Importing the dna Images for reference set 2.\n')
    dnaImages = ImportOneCamera( config.referenceSet2DnaCd, 'stack' );
    fprintf('The dna images for reference set 2 have been imported.\n')
    
    for i = 1: length(helicaseImages) 
        figure; imshow( helicaseImages{i}, [100 150]), colorbar , title(sprintf('Helicase Image %i', i))
        figure; imshow( dnaImages{i}, []), colorbar , title(sprintf('Dna Image %i', i))
    end
    
    output.helicaseImage = CreateHelicaseImage2(helicaseImages);
    output.dnaImage = CreateDnaImage2(dnaImages);
end

