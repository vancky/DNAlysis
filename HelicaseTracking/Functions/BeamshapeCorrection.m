function [ output ] = BeamshapeCorrection( config , images )
    % Beamshape Correction - Corrects for the beamshape profile
    % Please input the images as a 3D matrix, i.e. images(:,:,N) where N is
    % the total number of images
    
    % Generates the matrix with the normalized beamshape
    fprintf('Calculating the Beamshape.\n')
    [beamshape, test] =GenerateBeamshape(config); 
    fprintf('Beamshape calculated.\n')
    % Multiplies the normalized beamshape with the images
    
    numImages=size(images,3);
    output.image=zeros(config.pixels,config.pixels,numImages, class(images));
    
    for i=1:numImages
       output.image(:,:,i)=double(images(:,:,i)).*beamshape;
    end
    fprintf('Beamshape Corrected.\n')
end

