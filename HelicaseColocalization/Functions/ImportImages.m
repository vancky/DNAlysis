function [ output ] = ImportImages( config )
    % Import Images - Imports all relevant images

    switch config.importOption
        case 'import'
            fprintf('Importing Camera Correlation Images.\n')
            importedCameraCorrelationImages = ImportTwoCameras( config.cameraCorrelationCd, 'stack');
            fprintf('Importing Split Correlation Images.\n')
            importedSplitCorrelationImages =  ImportOneCamera( config.splitCorrelationCd, 'stack');
            output.cameraCorrelation = importedCameraCorrelationImages;
            output.splitCorrelation = importedSplitCorrelationImages;
           
            fprintf('Importing Helicase and Dna Images.\n')
            importedCameraImages =  ImportTwoCameras( config.multiCamCd, 'stack');
            output.cam0 = importedCameraImages.cam0;
            output.cam1 = importedCameraImages.cam1;
            
            save( config.matFileCd , 'importImages');
            
        case 'load'
            load( config.matFileCd );
            output = importImages;
            
        otherwise
            fprintf('Please specify a correct option for importing the images.\n')
            
    end
    
    fprintf('Images Imported.\n')
end

