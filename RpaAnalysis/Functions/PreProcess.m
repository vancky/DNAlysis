function [ output ] = PreProcess( config, inputImages )
    % Pre Process - Pre processes the relevant images
    % Detailed explanation goes here

    startFrame = 10;
    endFrameFix = cell(1, config.numFovs);
    endFrameFix{4} = 40;

    
    for ii = 1:config.numFovs
        numFrames = size( inputImages.cam0{ii}, 3);
        
        if ~isempty( endFrameFix{ii})
            endFrame = endFrameFix{ii};
        else
            endFrame = numFrames;
        end      

        idx = 0;
        correctCam0 = [];
        correctCam1 = [];
        
        for j = startFrame:endFrame
            idx = idx+1;
            cam0 = inputImages.cam0{ii}(:,:,j);
            cam1 = inputImages.cam1{ii}(:,:,j);
            
            cam0Filtered = BackgroundFilterNoScale( cam0);
            cam1Filtered = BackgroundFilterNoScale( cam1);
            
            %alignedImages = AlignCameraImages( config, cam0, cam1);
            %alignedImagesNonLinear = CorrectCameraImagesNonLinear( config, alignedImages) ;
            
            correctCam0(:,:,idx) = cam0Filtered;
            correctCam1(:,:,idx) = cam1Filtered;
        end
        output{ii}.cam0 = uint16( correctCam0);
        output{ii}.cam1 = uint16( correctCam1);
    end
    
end

