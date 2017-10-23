function [ outputImage ] = WatershedImage( inputImage )
    % HelicaseWatershed - Give as input an image, this function will find
    % the watershed lines distinguishing different local maxima in the
    % picture and will set these lines to 0 in the original image
    
%     invertImage = abs(inputImage - max(inputImage(:)));
    invertImage = inputImage;
    watershedImage = watershed(invertImage);
    binary = watershedImage>0;
    outputImage= inputImage.*binary; 
    
%     The lines below can be uncommented to visualise if the WatershedImage
%     function is performing as you expect. 
% 
%     figure;
    subplot(1,2,1); imshow( inputImage , []); title('Helicase Image'); colorbar
    subplot(1,2,2); imshow( outputImage , []); title('Watershed Helicase Image'); colorbar
end

