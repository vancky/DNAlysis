function [ output ] = DisplayShotNoise( config , noiseImages )
    % PoissonFit Summary of this function goes here
    %   Detailed explanation goes here
    
    expTimes=config.shotnoiseExposureTime;
    numExpTimes= size(noiseImages , 2 );
    
    for i=1:numExpTimes
        inputImage0=noiseImages{i}.cam0;
        inputImage1=noiseImages{i}.cam1;        
        PoissonFit( inputImage0 , 1 , expTimes(i) , 0 );
        PoissonFit( inputImage1 , 1 , expTimes(i) , 1 );
    end
end

