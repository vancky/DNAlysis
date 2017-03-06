function [ output_args ] = Visualization( loadImage, dnaFinder, filterImage, spotFinder, config)
%VISUALIZATION Summary of this function goes here
%   Detailed explanation goes here
%% How well does the spotfinder work?
for i=1:config.numberOfMeasurements
    figure
    subplot(2,2,1), imshow(loadImage{i,1}.image,[]), title('Original Image')
    subplot(2,2,2), imshow(filterImage{i,1}.outputImage,[]), title('Filtered Image')
    subplot(2,2,3), imshow(spotFinder{i,1}.logic,[]), title('spotfinder')
    subplot(2,2,4), imshow(dnaFinder{i,1}.dna,[]), title('DNA finder')
end

%%  DNA boxes Visualisation, DELETE LATER!
for i=1:config.numberOfMeasurements
    figure 
    subplot(1,2,2), imshow(filterImage{i,1}.outputImage,[]), title('Filtered Image with found DNA')
    for j=1:length(dnaFinder{i,1}.goodBoxes)
        rectangle('position',dnaFinder{i,1}.goodBoxes(j).BoundingBox,'EdgeColor','r')
    end
    subplot(1,2,1), imshow(loadImage{i,1}.image,[]), title('Original Image')
    for j=1:length(dnaFinder{i,1}.goodBoxes)
        rectangle('position',dnaFinder{i,1}.goodBoxes(j).BoundingBox,'EdgeColor','r')
    end
end


end

