function [ generateGaussian ] = GenerateGaussian( config , parameters ) 
    % GenerateGaussian  - generates a 2D Gaussian
    % The parameter vector should contain [ mu_x , mu_y , sigma, scaleValue ]
       
    mu_x=parameters(1);
    mu_y=parameters(2);
    sigma=parameters(3);
    scaleValue=parameters(4);
    domainSize = 1+2*config.fitSize;
    
    x = 1:domainSize;
    y = 1:domainSize;
    [X,Y] = meshgrid(x,y);
    
    generateGaussian= scaleValue*exp(-((X-mu_x).^2+(Y-mu_y).^2)/(2*sigma^2));
end

