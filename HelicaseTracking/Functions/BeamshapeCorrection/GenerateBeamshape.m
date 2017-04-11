function [ output, test ] =GenerateBeamshape( config )
    % Generate Beamshape - Generates matrix with normalized beamshape
    % 1. Import images with the beamshape
    % 2. Normalize this matrix
    % 3. Correct for the dust particles (NOTE: REMOVE THIS STEP LATER)
    
    % Step 1
    fprintf('Calculating the Beamshape.\n')
    cd(config.beamshapeCd);                         % Sets image folder
    directory = dir('*cam0_273*.tiff');                 % Labels all the tiffFiles with cam0 in the current directory
    numFiles = length(directory);                   % Number of individual image
    
    image=zeros(config.pixels,config.pixels,numFiles, config.dataType);
    for k = 1:numFiles  
        image(:,:,k)=imread(directory(k).name);             %Import the images
    end
    cd(config.matlabCd)          
        
    test.beamshape=zeros(config.pixels);
    for i=1:numFiles
        test.beamshape=test.beamshape+double(image(:,:,i));           % We use double to make sure that the maximum of uint16 isn't reached
    end
    
    % Step 2
    
    test.beamshapeNorm=max(test.beamshape(:))./test.beamshape;
      
    % Step 3 - set the dust particles and dark band correction to 1 instead of being very large
    
    test.beamshapeFilter=BallSmooth(test.beamshapeNorm,5);
    
    %histogram(output.beamshapeNorm) Use a histogram to check which limit to
    %use, later on we can use the shotnoise to just set an automatic limit.
    limit=3;
    test.beamshapeFilter(test.beamshapeFilter>limit)=1;  
    
    output=test.beamshapeFilter;
    fprintf('Beamshape calculated.\n')
end

