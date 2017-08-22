function [ output ] = SimulateHelicase( parameters )
    % Generate Simulation Mask - generates a full size gaussian mask
 
    mu_x=parameters(1);
    mu_y=parameters(2);
    sigma=parameters(3);
    scaleValue=parameters(4);
    domainSizeX = parameters(5);
    domainSizeY = parameters(6);
    
    x = 1:domainSizeX;
    y = 1:domainSizeY;
    [X,Y] = meshgrid(x,y);
    
    generateGaussian= scaleValue*exp(-((X-mu_x).^2+(Y-mu_y).^2)/(2*sigma^2));
    output= generateGaussian;
    
end

