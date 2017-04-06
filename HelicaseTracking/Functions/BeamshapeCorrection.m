function [ output ] = BeamshapeCorrection( config , images )
    % Beamshape Correction - Corrects for the beamshape profile
    % 1.Analyses images with only the beamshape profile, generates a
    %   normalized matrix with intensity values. 
    % 2. Uses this matrix to correct the intensity of the other images.
    
    % Generates the matrix with the normalized beamshape
    
    [beamshape, test] =GenerateBeamshape(config); 
    
    % Multiplies the normalized beamshape with the images
    
    numImages=length(images);
    output=zeros(config.pixels,config.pixels,numImages, config.dataType);
    
    for i=1:numImages
       output(:,:,i)=images(:,:,i).*beamshape;
    end

end

