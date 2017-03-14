function [ gaussianFunction] = GaussianFunction( domainSize, steps, mu_x, mu_y, sigma , scaleValue ) 
%GAUSSIANFUNCTION Summary of this function goes here
%   Detailed explanation goes here
    
    x=linspace(1,domainSize,steps);
    y=linspace(1,domainSize,steps);
    [X,Y] = meshgrid(x,y);
    gaussianFunction=(1/(2*pi*sigma^2))*exp(-((X-mu_x).^2+(Y-mu_y).^2)/2*sigma^2);
    %gaussianFunction= scaleValue*gaussianFunction;
end

