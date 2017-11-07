function [ output ] = PreProcess( config, importImages )
    % Pre Process - Performs pre processing when using data from multiple 
    % cameras
    
    for ii = 1:config.numFovs
        cam0 = importImages.cam0{ii};
        cam1 = importImages.cam1{ii};

        alignedImages = AlignCameraImages( config, cam0, cam1);
        alignedImagesNonLinear = CorrectCameraImagesNonLinear( config, alignedImages) ;

        cropCoordinates = config.cropCoordinatesNonLinear;
        cam0Cropped{ii} = CropImage( cropCoordinates, alignedImagesNonLinear.cam0);
        cam1Cropped{ii} = CropImage( cropCoordinates, alignedImagesNonLinear.cam1);
        
        
        cam0Corrected{ii} = BeamshapeCorrectionSelf( cam0Cropped{ii}, [30 30]);
        cam1Corrected{ii} = BeamshapeCorrectionSelf( cam1Cropped{ii}, [30 30]);
        
        cam0Normalized{ii} = BackgroundFilterNoScale( cam0Corrected{ii});
        cam1Normalized{ii} = BackgroundFilterNoScale( cam1Corrected{ii});
        
    end
    
    output.cam0 = cam0Normalized;
    output.cam1 = cam1Normalized;
end

