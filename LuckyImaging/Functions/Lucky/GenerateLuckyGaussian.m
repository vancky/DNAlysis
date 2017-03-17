function [ generateLuckyGaussian ] = GenerateLuckyGaussian( config, parameters )
    % GenerateGaussianMask
    % Generates a Gaussian mask based on the fitting parameters.
    % if the fit has failed (can be seen by exitflag) simply replace the
    % patch with background noise (0).
       
    mu_x=parameters(1);
    mu_y=parameters(2);
    sigma=parameters(3);
    scaleValue=parameters(4);
    domainSize=config.imageSize;
    
    x=1:domainSize;
    y=1:domainSize;
    [X,Y] = meshgrid(x,y);
    
  
    generateLuckyGaussian= scaleValue*exp(-((X-mu_x).^2+(Y-mu_y).^2)/(2*sigma^2));
    
    
end

