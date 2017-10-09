function [ output ] = ImportImages( config )
    % Import Images - Imports all relevant images
    % Specify an importType 'OneCamera' or 'TwoCameras'. Depending on the
    % type of images you are analyzing.

    switch config.importOption
        case 'import'
            %fprintf('Importing Camera Correlation Images.\n')
            %importedCameraCorrelationImages = ImportTwoCameras( config.cameraCorrelationCd, 'stack');
            %fprintf('Importing Split Correlation Images.\n')
            %importedSplitCorrelationImages =  ImportOneCamera( config.splitCorrelationCd, 'stack');
            %output.cameraCorrelation = importedCameraCorrelationImages;
            %output.splitCorrelation = importedSplitCorrelationImages;
            
            fprintf('Importing Helicase and Dna Images.\n')
            importedCameraImages =  ImportTwoCameras( config.multiCamCd, 'all');
            output.cam0 = importedCameraImages.cam0;
            output.cam1 = importedCameraImages.cam1;

            importImages = output;
            save( config.saveMatFileCd , 'importImages');
            
        case 'load'
            load( config.loadMatFileCd );
            output = importImages;
        otherwise
            fprintf('Please specify a correcect option for importing the images.\n')
    end
    
    fprintf('Images Imported.\n')
end

