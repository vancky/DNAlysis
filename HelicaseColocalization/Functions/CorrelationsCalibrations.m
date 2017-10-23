function [ config, output ] = CorrelationsCalibrations( config, importImages )
    % Correlations Calibrations - This function performs the relevant 
    % correlations and calibrations
   
    splitCorrelation = SplitCorrelation( config, importImages.splitCorrelation{1} );
    config.splitCorrelation = [ splitCorrelation.rowCorrection , splitCorrelation.colCorrection ];
    config.cropCoordinates = GenerateCropCoordinates( importImages.splitCorrelation{1}, config.imageDirection);
    
    cameraCorrelation = CameraCorrelation( config, importImages.cameraCorrelation);
    config.cameraCorrelation = cameraCorrelation.coordinates;

    config.numFovs = length( importImages.cam0);
   
    output.splitCorrelation = splitCorrelation;
    output.cameraCorrelation = cameraCorrelation;
end

