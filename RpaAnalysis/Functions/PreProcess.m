function [ output ] = PreProcess( config, importImages )
    % Pre Process - Pre processes the relevant images
    % Detailed explanation goes here

    for ii = config.numFovs
        numFrames = size(importImages.cam0, 3);
        for j = 1:numFrames
            cam0 = importImages.cam0{ii}(:,:,j);
            cam1 = importImages.cam1{ii}(:,:,j);
            
            alignedImages = AlignCameraImages( config, cam0, cam1);
            alignedImagesNonLinear = CorrectCameraImagesNonLinear( config, alignedImages) ;
    
            cropCoordinates = config.cropCoordinatesNonLinear;
            cropCoordinates = []
            cam0Cropped = CropImage( cropCoordinates, alignedImagesNonLinear.cam0);
            cam1Cropped = CropImage( cropCoordinates, alignedImagesNonLinear.cam1);
    
            output.cam0{ii}(:,:,j) = cam0Cropped;
            output.cam1{ii}(:,:,j) = cam1Cropped;
        end
    end
end

