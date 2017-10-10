function [ outputImage ] = CropImage( cropCoordinates, inputImage )
    % Crop Image 
    % Give as input [minX, maxX, minY, maxY] of the new image and the image
    % itself. For instance CropImage( [10, 240, 40, 500] )
        
    xMin = cropCoordinates(1);
    xMax = cropCoordinates(2);
    yMin = cropCoordinates(3);
    yMax = cropCoordinates(4);
    
    outputImage =  inputImage( yMin:yMax, xMin:xMax);

end

