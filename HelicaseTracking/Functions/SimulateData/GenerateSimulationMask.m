function [ output ] = GenerateSimulationMask( config , parameters )
    % Generate Simulation Mask - generates a full size gaussian mask
 
    mu_x=parameters(1);
    mu_y=parameters(2);
    sigma=parameters(3);
    scaleValue=parameters(4);
    domainSize = config.pixels;
    
    x = 1:domainSize;
    y = 1:domainSize;
    [X,Y] = meshgrid(x,y);
    
    generateGaussian= scaleValue*exp(-((X-mu_x).^2+(Y-mu_y).^2)/(2*sigma^2));
    output=uint16(generateGaussian);
    
end

