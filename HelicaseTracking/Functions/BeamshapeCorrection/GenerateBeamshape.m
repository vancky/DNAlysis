function [ output, test ] =GenerateBeamshape( config , inputImages)
    % Generate Beamshape - Generates matrix with normalized beamshape
    % 1. Import images with the beamshape
    % 2. Normalize this matrix
    % 3. Correct for the dust particles (NOTE: REMOVE THIS STEP LATER)
    
    % Step 1
    fprintf('Calculating the Beamshape.\n')
    
    test.beamshape.cam0=inputImages.cam0;
    test.beamshape.cam1=inputImages.cam1;
    
    figure;
    imshow(inputImages.cam0 , []); title('Beamshape camera 0');
    figure;
    imshow(inputImages.cam1 , []); title('Beamshape camera 1');
    
    % Step 2 - normalize the matrix
    
    test.beamshapeNorm.cam0=max(test.beamshape.cam0(:))./test.beamshape.cam0;
    test.beamshapeNorm.cam1=max(test.beamshape.cam1(:))./test.beamshape.cam1;
      
    % Step 3 - set the dust particles and dark band correction to 1 instead of being very large
    
    test.beamshapeFilter.cam0=BallSmooth(test.beamshapeNorm.cam0,5);
    test.beamshapeFilter.cam1=BallSmooth(test.beamshapeNorm.cam1,5);
    
    %histogram(output.beamshapeNorm) Use a histogram to check which limit to
    %use, later on we can use the shotnoise to just set an automatic limit.
    limit=3;
    test.beamshapeFilter.cam0(test.beamshapeFilter.cam0>limit)=1;  
    test.beamshapeFilter.cam1(test.beamshapeFilter.cam1>limit)=1;  
    
    output=test.beamshapeFilter;
    
    figure;
    imshow(output.cam0 , []); title('Beamshape correction camera 0');
    figure;
    imshow(output.cam1 , []); title('Beamshape correction matrix camera 1');
    
    fprintf('Beamshape calculated.\n')
end

