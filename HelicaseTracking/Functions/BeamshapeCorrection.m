function [ output ] = BeamshapeCorrection( config , beamshape, images )
    % Beamshape Correction - Corrects for the beamshape profile
    % Please input the images as a 3D matrix, i.e. images(:,:,N) where N is
    % the total number of images
    
    % Multiplies the normalized beamshape with the images
    
    numImages=size(images,3);
    output=zeros(config.pixels,config.pixels,numImages, class(images));
    
    for i=1:numImages
       output(:,:,i)=double(images(:,:,i)).*beamshape;
    end
    fprintf('Beamshape Corrected.\n')
end

