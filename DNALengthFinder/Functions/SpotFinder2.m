function [ logic ] = SpotFinder2( filtImgOutput )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    image=double(filtImgOutput);
    logic=filtImgOutput>3;   
end

