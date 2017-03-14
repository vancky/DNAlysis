function [ fitGaussian ] = FitGaussian( config, data )
    % FitGaussian
    % Takes as input a fluorescent patch called data and
    % a vector containing the guessing parameters
    % x0= [mu_x , mu_y , sigma , scaling factor]
    x0=config.initialGuess;                     % the initial guess
    domainSize=2*config.brightFinderSize+1;     % the size of the patch
    
    x=1:domainSize;
    y=1:domainSize;
    [X,Y]=meshgrid(x,y);
    
    % The minimization function   x(1) is mu_x,   x(2) is mu_y,    x(3) is
    % sigma, x(4) is the scaleValue
    gaussianFunction = @(x) (x(4)/(2*pi*x(3)^2))*exp(-((X-x(1)).^2+(Y-x(2)).^2)/2*x(3)^2)-double(data);
    
    %Vector containing all the guesses
    options = optimoptions(@lsqnonlin, 'Algorithm', 'levenberg-marquardt');
    [fitGaussian.fit , fitGaussian.resnorm]=lsqnonlin(gaussianFunction,x0,[],[],options);
    
end

