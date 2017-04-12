function [ output ] = BeamshapeCorrection( config , beamshape, images )
    % Beamshape Correction - Corrects for the beamshape profile
    % Please input the images as a 3D matrix, i.e. images(:,:,N) where N is
    % the total number of images
    
    % Multiplies the normalized beamshape with the images
    
    numImages=size(images,3);
    output=zeros(config.pixels,config.pixels,numImages, class(images));
    
    for i=1:numImages
       output(:,:,i)=double(images(:,:,i)).*beamshape;
       figure;
       subplot(1,2,1); imshow(images(:,:,i),[]); title('Input Image');
       subplot(1,2,2); imshow(output(:,:,i),[]); title('Beamshape Corrected');
    end
    
    
    fprintf('Beamshape Corrected.\n')
end

