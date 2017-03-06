function [ spotFinder ] = SpotFinder( filtImgOutput , config )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    image=double(filtImgOutput);
    spotFinder.logic=filtImgOutput>config.spotFinderThreshold;   
end

