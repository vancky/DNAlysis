function [ output ] = CreateDnaImage2( dnaImages )
%CREATEDNAIMAGE2 Summary of this function goes here
%   Detailed explanation goes here

    croppedImage{1} = dnaImages{1}(:, 270:495);
    croppedImage{2} = dnaImages{2}(:, 270:495);
    croppedImage{3} = dnaImages{3}(:, 270:495);
    croppedImage{4} = dnaImages{4}(:, 270:495);
    croppedImage{5} = dnaImages{5}(:, 270:495);
    
    output = croppedImage;
    
    % This code can be uncommented to visualise the cropping
%     for i = 1:5
%         figure; 
%         subplot(1,2,1);
%         imshow( croppedImage{i}, []); colorbar;
%         title( sprintf('Cropped Image %i', i)); 
%         subplot(1,2,2);
%         imshow( dnaImages{i}, []); colorbar;
%         title( sprintf('Dna Image %i', i)); 
%     end
end

