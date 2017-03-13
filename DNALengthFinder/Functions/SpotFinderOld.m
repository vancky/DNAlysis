function [ spotFinderOld ] = SpotFinderOld( filterImage )
    %UNTITLED Summary of this function goes here
    %Detailed explanation goes here
    filtImg=filterImage{1,1}.outputImage;
    inputLogic=filtImg<2;
    filtImg(inputLogic)=0;
    image=double(filtImg);
    generateSpot=GenerateGaussian(15,7,8,4,4,4,9);   %Generate a Gaussian spot profile, currently based approximately on X[359:374]-Y[264:271] of filterImage{1,1}
    spot=generateSpot.scaleOne;
    
    spotFinderOld.convolution=conv2(image,spot,'same');
    spotFinderOld.logic=spotFinderOld.convolution>3;
    spotFinderOld.spotsFound=image.*spotFinderOld.logic;
    
    figure; imshow(filtImg,[]);
    figure; imshow(spotFinderOld.convolution,[]); 
    figure; imshow(spotFinderOld.logic,[])
    
end

