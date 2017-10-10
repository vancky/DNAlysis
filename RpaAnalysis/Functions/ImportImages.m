function [ output ] = ImportImages( config )
    % Import Images - Imports all relevant images
    % Specify an importType 'OneCamera' or 'TwoCameras'. Depending on the
    % type of images you are analyzing.

    switch config.importOption
        case 'import'
            %fprintf('Importing Camera Correlation Images.\n')
            %importImages.cameraCorrelation = ImportTwoCameras( config.cameraCorrelationCd, 'stack');

            %fprintf('Importing Split Correlation Images.\n')
            %importImages.splitCorelation=  ImportOneCamera( config.splitCorrelationCd, 'stack');
            
            fprintf('Importing Beamshape Correction Images.\n')
            importImages.beamshape = ImportTwoCameras( config.beamshapeCorrectionCd, 'stack');
            
            fprintf('Importing Helicase and Dna Images.\n')
            importedCameraImages =  ImportTwoCameras( config.multiCamCd, 'all');
            importImages.cam0 = importedCameraImages.cam0;
            importImages.cam1 = importedCameraImages.cam1;

            output = importImages;
            save( config.saveMatFileCd , 'importImages');
            fprintf('Images have been imported and saved to %s.\n', config.saveMatFileCd)
        case 'load'
            load( config.loadMatFileCd );
            output = importImages;
            fprintf('Images have been loaded from %s.\n', config.loadMatFileCd)
        otherwise
            fprintf('Please specify a correcect option for importing the images.\n')
    end
    
    
end

