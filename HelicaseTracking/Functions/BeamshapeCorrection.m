function [ output ] = BeamshapeCorrection( config , images )
    % Beamshape Correction - Corrects for the beamshape profile
    % Please input the images as a 3D matrix, i.e. images(:,:,N) where N is
    % the total number of images
    
    % Generates the matrix with the normalized beamshape
    
    [beamshape, test] =GenerateBeamshape(config); 
    
    % Multiplies the normalized beamshape with the images
    
    numImages=length(images);
    output=zeros(config.pixels,config.pixels,numImages, config.dataType);
    
    for i=1:numImages
       output(:,:,i)=images(:,:,i).*beamshape;
    end

end

