function [ scaledImage ] = beamshapeCorrection(loadImgOutput )
    %BEAMSHAPECORRECTION Corrects for the beamshape profile.
    %Detailed explanation goes here

    %This part is to simulate a beamshape profile, run these 3 lines to see
    %how the beamshape profile looks like we need a real one in the end!
    fshow=GenerateGaussian(512,512,256,256,200,200,200);
    fshow=uint16(fshow);
    imshow(fshow,[]);
    % This will be the scaling part!
    f=GenerateGaussian(512,512,256,256,200,200,1);
    beamScaling=1./f;
    numLoadImgOutput=double(loadImgOutput);
    scaledImage=uint16(numLoadImgOutput.*beamScaling);
    


end

