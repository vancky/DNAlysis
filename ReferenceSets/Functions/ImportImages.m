function [ output ] = ImportImages( config )
    % Import Images - Imports all relevant images


    switch config.importOption
        case 'import'
            fprintf('Importing the helicase Images for reference set 2.\n')
            importImages.referenceSet2.helicase = ImportOneCamera( config.referenceSet2HelicaseCd, 'stack' );
            fprintf('The helicase images for reference set 2 have been imported.\n')

            fprintf('Importing the dna Images for reference set 2.\n')
            importImages.referenceSet2.dna = ImportOneCamera( config.referenceSet2DnaCd, 'stack' );
            fprintf('The dna images for reference set 2 have been imported.\n')

            output = importImages;
            save( config.matFileCd , 'importImages');
            fprintf('Images have been imported and saved to %s.\n', config.matFileCd)
        case 'load'
            load( config.matFileCd );
            output = importImages;
            fprintf('Images have been loaded from %s.\n', config.matFileCd)
        otherwise
            fprintf('Please specify a correcect option for importing the images.\n')
    end

end
