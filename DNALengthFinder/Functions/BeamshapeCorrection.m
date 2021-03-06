function [ beamshapeCorrection ] = BeamshapeCorrection( loadBeamshape , loadImage)
    %BEAMSHAPECORRECTION Corrects for the beamshape profile.
    %This function simply substracts the beamshape profile from the image
    
    beamshapeCorrection.correctImage=loadImage.image-loadBeamshape.ballFilt;
    beamshapeCorrection.correctImageNoScale=loadImage.imageNoScale-loadBeamshape.ballFiltNoScale;

end

