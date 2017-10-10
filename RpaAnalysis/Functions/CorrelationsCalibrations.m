function [ config , output ] = CorrelationsCalibrations( config, importImages )
    % Correlations Calibrations - This function performs the relevant 
    % correlations and calibrations
    
    
    %splitCorrelation = SplitCorrelation( config, importImages.beamshape.cam0{1} );
    %config.splitCorrelation = [ splitCorrelation.rowCorrection , splitCorrelation.colCorrection ];
    config.cropCoordinates = GenerateCropCoordinates( importImages.beamshape.cam0{1}, config.imageDirection);
    
    
    
    cameraCorrelation = CameraCorrelation( config, importImages.cameraCorrelation);
    config.cameraCorrelation = cameraCorrelation.coordinates;

    
    output = [];
%     output.splitCorrelation = splitCorrelation;
%     output.cameraCorrelation = cameraCorrelation;
end

