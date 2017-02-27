function [ output_args ] = visualization( loadImgOutput, configOutputVelocity, j , configCmap )
%VISUALIZATION Summary of this function goes here
%   Detailed explanation goes here


subplot(3,3,j) ,imshow(loadImgOutput{j},configCmap), title(strcat('Fluid velocity ',num2str(configOutputVelocity(j)), ' ul/min'));


end

