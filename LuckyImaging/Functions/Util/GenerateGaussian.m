function [ generateGaussian ] = GenerateGaussian( config, parameters ) 
    % GenerateGaussian  - generates a 2D Gaussian
    % The parameter vector should contain [ mu_x , mu_y , sigma ]
       
    domainSize=2*config.brightFinderSize+1;     % the size of the patch

    mu_x=parameters(1);
    mu_y=parameters(2);
    sigma=parameters(3);
    scaleValue=parameters(4);
    
    x=1:domainSize;
    y=1:domainSize;
    [X,Y] = meshgrid(x,y);
    
    generateGaussian=(scaleValue/(2*pi*sigma^2))*exp(-((X-mu_x).^2+(Y-mu_y).^2)/2*sigma^2);
end

