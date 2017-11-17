function [ config, output ] = BeamshapeCorrection( config, importImages )
    % Beamshape Correction - Corrects for the beamshape profile
    % Please input the images as a 3D matrix, i.e. images(:,:,N) where N is
    % the total number of images
    fprintf('Correcting the beamshape...\n')
    % Calculates the crop coordinates for cam0
    config.cropCoordinates = GenerateCropCoordinates( importImages.beamshape.cam0{1}, config.imageDirection);
    % Amount of field of views for analysis.
    config.numFovs = length( importImages.cam0);
       
    for ii = 1:config.numFovs
        numFrames = size( importImages.cam0{ii}, 3);
        for j = 20:21 %numFrames
            % Crops the image from cam 0
            croppedImage = CropSplitCam0( config, importImages.cam0{ii}(:,:,j));
            
            cam0 = croppedImage;
            cam1 = importImages.cam1{ii}(:,:,j);
            
            % Multplies with the beamshape matrix            
            correctedImage0 = BeamshapeCorrectionSelf( cam0, [50, 50]);
            correctedImage1 = BeamshapeCorrectionSelf( cam1, [50, 50]);       
            
            croppedCam0{ii}(:,:,j)= uint16(croppedImage);
            
            correctedCam0{ii}(:,:,j)= uint16(correctedImage0);
            correctedCam1{ii}(:,:,j)= uint16(correctedImage1);
            figure;
            figure; imshow( croppedImage, []); hcb= colorbar; set (hcb, 'YTick', []); axis equal; axis tight
            figure; imshow( correctedImage0{1}(:,:,20), []); hcb= colorbar; set (hcb, 'YTick', []); axis equal; axis tight
        end
    end
    
    output.croppedcam0 = croppedCam0;
    output.cam0 = correctedCam0;
    output.cam1 = correctedCam1;
    
    fprintf('Beamshape Corrected.\n')
    
end

