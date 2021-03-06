function [ output, test ] =GenerateBeamshape( config , inputImages)
    % Generate Beamshape - Generates matrix with normalized beamshape
    % 1. Import images with the beamshape
    % 2. Normalize this matrix
    % 3. Correct for the dust particles (NOTE: REMOVE THIS STEP LATER)
    
    % Step 1
    fprintf('Calculating the Beamshape.\n')
    
    test.beamshape.cam0=CropSplitImage( config, inputImages.cam0 );
    test.beamshape.cam0.noCrop=inputImages.cam0;
    test.beamshape.cam1=inputImages.cam1;
    
    figure; imshow( inputImages.cam0 , [] ) ; title('Beamshape camera 0');
    figure; imshow( inputImages.cam1 , [] ) ; title('Beamshape camera 1');
    
    % Step 2 - normalize the matrix
    
    test.beamshapeNorm.cam0.leftImage=max(test.beamshape.cam0.leftImage(:))./test.beamshape.cam0.leftImage;
    test.beamshapeNorm.cam0.rightImage=max(test.beamshape.cam0.rightImage(:))./test.beamshape.cam0.rightImage;
    test.beamshapeNorm.cam1=max(test.beamshape.cam1(:))./test.beamshape.cam1;
      
    % Step 3 - correct for the dust particles
    
    test.beamshapeFilter.cam0.leftImage =  medfilt2( test.beamshapeNorm.cam0.leftImage , [10 10] ,  'symmetric' );
    test.beamshapeFilter.cam0.rightImage = medfilt2( test.beamshapeNorm.cam0.rightImage , [10 10] , 'symmetric');
    % No need to do this for cam1
    test.beamshapeFilter.cam1=test.beamshapeNorm.cam1;

    
    output=test.beamshapeFilter;
    
    figure;
    subplot(1,2,1); imshow(test.beamshapeNorm.cam0.leftImage , []); title('Beamshape correction camera 0 left NO FILTER');
    subplot(1,2,2); imshow(test.beamshapeNorm.cam0.rightImage , []); title('Beamshape correction camera 0 right NO FILTER');
    figure;
    subplot(1,2,1); imshow(output.cam0.leftImage , []); title('Beamshape correction camera 0 left');
    subplot(1,2,2); imshow(output.cam0.rightImage , []); title('Beamshape correction camera 0 right');
    figure;
    imshow(output.cam1 , []); title('Beamshape correction matrix camera 1');
    
    fprintf('Beamshape calculated.\n')
end

