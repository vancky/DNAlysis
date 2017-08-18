function [ output ] = ImportImages( config )
    % Import Images - Imports all relevant images
    % Specify an importType 'OneCamera' or 'TwoCameras'. Depending on the
    % type of images you are analyzing.

    fprintf('Importing Camera Correlation Images.\n')
    importedCameraCorrelationImages =  ImportTwoCameras( config.cameraCorrelationCd, 'stack');
    fprintf('Importing Split Correlation Images.\n')
    importedSplitCorrelationImages =   ImportOneCamera( config.splitCorrelationCd, 'stack');
    output.cameraCorrelation = importedCameraCorrelationImages;
    output.splitCorrelation = importedSplitCorrelationImages;
    
    switch config.importType
        case 'OneCamera'
            fprintf('Importing Helicase Images.\n')
            importedHelicaseImages=            ImportOneCamera( config.helicaseCd, 'stack');
            fprintf('Importing Dna Images.\n')
            importedDnaImages=                 ImportOneCamera( config.dnaCd, 'stack');
            output.helicase = importedHelicaseImages;
            output.dna = importedDnaImages;
            
        case 'TwoCameras'
            fprintf('Importing Helicase and Dna Images.\n')
            importedCameraImages =  ImportTwoCameras( config.cameraCorrelationCd, 'stack');
            output.cam0 = importedCameraImages.cam0;
            output.cam1 = importedCameraImages.cam1;
        otherwise
            fprintf('Please specify a correct importType, either ''OneCamera'' or ''TwoCameras''.\n')
    end
    
    fprintf('Images Imported.\n')
end

