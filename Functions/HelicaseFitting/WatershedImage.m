function [ outputImage ] = WatershedImage( inputImage, varargin )
    % HelicaseWatershed - Give as input an image, this function will find
    % the watershed lines distinguishing different local maxima in the
    % picture and will set these lines to 0 in the original image
    % by default, this function inverts the image. If you want to watershed
    % the original image use WatershedImage( inputImage, 'invert', false). 
    
    % Parses the optional input arguments
    p = inputParser;
    addOptional( p, 'invert', true);
    
    parse( p, varargin{:})    
    
    if p.Results.invert
        invertImage = abs(inputImage - max(inputImage(:)));
    else
        invertImage = inputImage;
    end
        
    watershedImage = watershed(invertImage);
    binary = watershedImage > 0;
    outputImage= inputImage.*binary; 
    
    
%     The lines below can be uncommented to visualise if the WatershedImage
%     function is performing as you expect. 
    
%     figure; 
%     subplot(1,2,1); imshow( watershedImage, []); title('Watershed Image')
%     subplot(1,2,2); imshow( binary); title('Binary watershed > 0')
%     figure;
%     subplot(1,2,1); imshow( inputImage , []); title('Helicase Image'); colorbar
%     subplot(1,2,2); imshow( outputImage , []); title('Watershed Helicase Image'); colorbar
end

