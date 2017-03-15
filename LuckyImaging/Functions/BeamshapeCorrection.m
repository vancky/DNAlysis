function [ beamshapeCorrection ] = BeamshapeCorrection( beamshape , image)
    %BEAMSHAPECORRECTION Corrects for the beamshape profile.
    %This function simply substracts the beamshape profile from the image
    
    beamshapeCorrection=image-beamshape;

end

