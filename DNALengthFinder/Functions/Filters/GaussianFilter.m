function [ gaussianFilter ] = GaussianFilter( inputImage, x_dim,y_dim,mu_x,mu_y,sigma_x,sigma_y  )
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here
    generateGaussian=GenerateGaussian(x_dim,y_dim,mu_x,mu_y,sigma_x,sigma_y, 1 );
    filter=generateGaussian.scaleOne;
    gaussianFilter.outputImage= imfilter(inputImage,filter,'replicate');

end

