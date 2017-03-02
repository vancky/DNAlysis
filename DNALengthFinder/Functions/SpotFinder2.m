function [ logic ] = SpotFinder2( filtImgOutput , treshold )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    image=double(filtImgOutput);
    logic=filtImgOutput>treshold;   
end

