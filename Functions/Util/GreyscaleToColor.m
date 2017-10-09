function [ outputImage ] = GreyscaleToColor( greyscaleImage, range, color )
    % GreyscaleToColor - Converts a greyscale image to an rgb image
    % Give as inputs the greyscale image, the range with the low and high 
    % greyscale values to be normalized (similar to imshow). And finally, 
    % the color to which to convert, this can be red, green or blue. 
    % For instance GreyscaleToColor( greyscaleImage , [0 100], 'red')
    
    greyscaleImage = (greyscaleImage - range(1)) / (range(2)-range(1));
    
    empty = zeros(size(greyscaleImage));
    switch color
        case 'red'
            outputImage = cat(3, greyscaleImage, empty, empty); 
            
        case 'green'
            outputImage = cat(3, empty, greyscaleImage, empty); 
            
        case 'blue'
            outputImage = cat(3, empty, green, greyscaleImage); 
            
        otherwise
            fprintf('Please specify a color, either red, green, blue')
    end   
    
    %figure;
    %image(outputImage); colorbar
end

