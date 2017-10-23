function [ output ] = ImportImages( config )
    % Import Images - Imports all relevant images
    % Specify an importType 'OneCamera' or 'TwoCameras'. Depending on the
    % type of images you are analyzing.

    switch config.importOption
        case 'import'
            fprintf('Importing Helicase and Dna Images.\n')
            importedCameraImages =  ImportOneCamera( config.calibrationCd, 'all');
            importImages.helicase = importedCameraImages;

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

