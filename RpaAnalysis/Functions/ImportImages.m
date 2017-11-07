function [ output ] = ImportImages( config )
    % Import Images - Imports all relevant images
    % Specify an importType 'OneCamera' or 'TwoCameras'. Depending on the
    % type of images you are analyzing.

    switch config.importOption
        case 'import'
            fprintf('Importing Camera Correlation Images.\n')
            importImages.cameraCorrelation = ImportTwoCameras( config.cameraCorrelationCd, 'stack');
         
            fprintf('Importing Helicase and Dna Images.\n')
            importedCameraImages =  ImportTwoCameras( config.multiCamCd, 'all');
            importImages.cam0 = importedCameraImages.cam0;
            importImages.cam1 = importedCameraImages.cam1;

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

