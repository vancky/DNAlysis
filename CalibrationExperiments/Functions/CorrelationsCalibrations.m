function [ config ] = CorrelationsCalibrations( config, importImages)
    % CORRELATIONSCALIBRATIONS Summary of this function goes here
    %   Detailed explanation goes here

    config.cropCoordinates = GenerateCropCoordinates( ...
                importImages.helicase{1}(:,:,3), config.imageDirection);
    
    config.numFovs = length( importImages.helicase );
    
end

 