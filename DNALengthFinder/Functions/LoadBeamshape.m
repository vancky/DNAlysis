function [ loadBeamshape ] = LoadBeamshape( config )
    %LOADBEAMSHAPE
    %-----------Import the beamshape profile, similar to LoadImage---------
    cd(config.beamshapeCd{1,1})          
    loadBeamshape.beamshape=0;                          
    directory = dir('*cam0*.tiff');               
    numFiles = length(directory);                 
    for k = 1:numFiles  
        loadBeamshape.beamshape=loadBeamshape.beamshape+imread(directory(k).name);          
    end
    loadBeamshape.beamshapeNoScale=loadBeamshape.beamshape;
    loadBeamshape.beamshape=loadBeamshape.beamshape/numFiles;
    % Apply a rolling ball filter with radius 20, to smoothen out the
    % beamshape.
    loadBeamshape.ballFilt=BallFilter(loadBeamshape.beamshape,20);
    loadBeamshape.ballFiltNoScale=BallFilter(loadBeamshape.beamshapeNoScale,20);
    
    cd(config.matlabCd{1,1})
end

