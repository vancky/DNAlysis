function [ output ] = PreProcessRpa( config, inputImages )
    % Pre Process Mcm
    
    numInputFrames = size( inputImages, 3);
    xSize = size( inputImages, 2);
    
    CropCoordinates(1) = 1;
    CropCoordinates(2) = xSize;
    CropCoordinates(3) = config.cropCoordinates.top(1) + config.cropOffset;
    CropCoordinates(4) = config.cropCoordinates.top(2) - config.cropOffset;
    
    % Crop all images
    for ii = 1: numInputFrames
        cropImage(:,:,ii) = CropImage( CropCoordinates, inputImages(:,:,ii));
    end
    
    % The first frame is noise, so start at frame 2
    startFrame = 5;
    endFrame = numInputFrames - 5;
    
    images = cropImage( :, :, startFrame:endFrame);
   
    output = images;

end

