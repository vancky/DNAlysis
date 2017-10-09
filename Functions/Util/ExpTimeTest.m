function [ output ] = ExpTimeTest( exposureTime )
    % Exposure Time Test
    % Input exposureTime in ms
     
    
    totalTime= 10;
    
    numFrames = totalTime/exposureTime;
        
    lambda = 4;
    
    
    discreteSignal = 0;
    continuousSignal = 0;
    for i = 1:numFrames 
        pixelIntensity (i) = poissrnd( lambda )*exposureTime; 
        discreteSignal= discreteSignal + round( pixelIntensity(i) );
        
        continuousSignal = continuousSignal + pixelIntensity(i);
    end

    output.pixelIntensity = pixelIntensity;
    output.discrete = discreteSignal;
    output.continuous = continuousSignal;
    
    


end

