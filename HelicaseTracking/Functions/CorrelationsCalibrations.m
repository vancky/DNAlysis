function [ config , output ] = CorrelationsCalibrations( config, importImages )
    % Correlations Calibrations - This function performs the relevant 
    % correlations and calibrations
    
    splitCorrelation = SplitCorrelation( config, importImages.splitCorrelation{1} );
    config.splitCorrelation = [ splitCorrelation.rowCorrection , splitCorrelation.colCorrection ];
    config.cropCoordinates = GenerateCropCoordinates( importImages.splitCorrelation{1}, 'vertical');
    
    cameraCorrelation = CameraCorrelation( config, importImages.cameraCorrelation);
    config.cameraCorrelation = cameraCorrelation.coordinates;

    switch config.importType 
        case 'OneCamera'
            config.numFovs = length( importImages.helicase);
        case 'TwoCameras'
            config.numFovs = length( importImages.cam0);
        otherwise
            fprintf('Please specify a correct importType, either ''OneCamera'' or ''TwoCameras''.\n')
    end
    
    output.splitCorrelation = splitCorrelation;
    output.cameraCorrelation = cameraCorrelation;
end

