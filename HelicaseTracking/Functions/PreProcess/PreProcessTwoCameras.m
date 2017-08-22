function [ output ] = PreProcessTwoCameras( config, cam0, cam1 )
    % Pre Process Two Cameras - Performs pre processing when using data
    % from multiple cameras
    % Detailed explanation goes here

    output = AlignCameraImages( config, cam0, cam1);
end

