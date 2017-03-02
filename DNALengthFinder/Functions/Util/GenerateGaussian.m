function [generateGaussian ] = GenerateGaussian( x_dim,y_dim,mu_x,mu_y,sigma_x,sigma_y,max_value )
%GENERATEGAUSSIAN Summary of this function goes here
%   Detailed explanation goes here
    
x=1:x_dim;
y=1:y_dim;
[X,Y] = meshgrid(x,y);

rho=mean(mean((X-mu_x).*(Y-mu_y)))/(sigma_x*sigma_y);
generateGaussian.noScale=exp(-((X-mu_x).^2/sigma_x^2+(Y-mu_y).^2/sigma_y^2-2*rho*(X-mu_x).*(Y-mu_y)/(sigma_x*sigma_y))/(2-2*rho^2))/(2*pi*sigma_x*sigma_y*sqrt(1-rho^2));
f_max=max(max(generateGaussian.noScale));
scale=max_value/f_max;
generateGaussian.scaleMax=scale*generateGaussian.noScale;
generateGaussian.scaleOne=generateGaussian.noScale/sum(sum(generateGaussian.noScale));

end

