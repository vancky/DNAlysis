function [ output ] = DisplayShotNoise( config , noiseImages )
    % PoissonFit Summary of this function goes here
    %   Detailed explanation goes here
    
    expTimes=config.shotnoiseExposureTime;
    numExpTimes= size(noiseImages , 2 );
    
    for i=1:numExpTimes
        inputImage0=noiseImages{i}.cam0;
        inputImage1=noiseImages{i}.cam1;        
        PoissonFit( inputImage0 , 1 ,expTimes(i) , 0 );
        PoissonFit( inputImage1 , 1 , expTimes(i) , 1 );
    end
    
    A=10*ones(512,'uint16');
    B=imnoise(A,'Poisson')+90;
    B=double(B);
    pd=fitdist(B(:),'poisson');
    x=1:110;
    y=pdf(pd,x);
    figure; 
    subplot(1,2,2)
    hold on
    xMin=0;
    xMax=max(B(:));
    edges=[xMin, linspace( xMin+0.5 , xMax-0.5 , (xMax-xMin))];
    h=histogram(B,'BinEdges', edges );
    scaleFactor=max(h.Values)/max(y);
    plot(x,scaleFactor*y,'*')
    title('Poisson Fit to Shot Noise')
    xlabel('Photon Intensity')
    ylabel('Counts')
    hold off
    %PoissonFit(double(B),2, 99 ,99)
    
    
    
end

