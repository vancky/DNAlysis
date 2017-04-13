function [ outputImage ] = GenerateCropCoordinates( inputImage )
    % GenerateCropCoordinates - finds the coordinates for the black lines
    % in an image from camera 0.
    % Takes as input an (the beamshape in this case) image from camera 0 
    % and finds the coordinates of the black lines.
    
    splitImage=SplitImage(inputImage , 1);
    
    
    
    figure;
    imshow( splitImage.leftImage , [] )
    figure;
    imshow( splitImage.rightImage , [] )
    

end

