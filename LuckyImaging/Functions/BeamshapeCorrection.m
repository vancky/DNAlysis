function [ beamshapeCorrection ] = BeamshapeCorrection( loadBeamshape , importImage)
    %BEAMSHAPECORRECTION Corrects for the beamshape profile.
    %This function simply substracts the beamshape profile from the image
    
    beamshapeCorrection=importImage-loadBeamshape.ballFilt;

end

