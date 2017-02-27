function [ logic, spotsFound ] = SpotFinder( filtImgOutput )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    image=double(filtImgOutput);
    spot=GenerateGaussian(15,7,8,4,5,2,10);
    convolution=conv2(image,spot,'same');
    
    logic=convolution>1000;
    spotsFound=image.*logic;
    
    
end

