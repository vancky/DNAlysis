function [ fit,resnorm ] = FitGaussian( xGuess,yGuess,sigmaGuess,scaleGuess, domainSize, steps, data )
    %FITGAUSSIAN Summary of this function goes here
    %   Detailed explanation goes here
  
    x=linspace(1,domainSize,steps);
    y=linspace(1,domainSize,steps);
    
    [X,Y]=meshgrid(x,y);
    
    % The minimization function   x(1) is mu_x,   x(2) is mu_y,    x(3) is sigma
    % x(4) is the scaling factor
    gaussianFunction = @(x) (x(4)/(2*pi*x(3)^2))*exp(-((X-x(1)).^2+(Y-x(2)).^2)/2*x(3)^2)-data;
    
    x0= [xGuess,yGuess,sigmaGuess, scaleGuess];     %Vector containing all the guesses
        
    [fit,resnorm]=lsqnonlin(gaussianFunction,x0);
    
end

