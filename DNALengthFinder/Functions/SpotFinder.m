function [ spotFinder ] = SpotFinder( filtImgOutput , config )
    %SPOTFINDER - finds groups of spots
    %We define spots simply by setting an intensity threshold.
    image=double(filtImgOutput);
    spotFinder.logic=filtImgOutput>config.spotFinderThreshold;   
end

