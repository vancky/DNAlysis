function [ output ] = Analysis( config, beamshapeCorrection )
    % Analysis - Detects the relevant region of interests
    %   Detailed explanation goes here
    
    for ii = 1:config.numFovs
        fprintf('Data analysis progress %i/%i.\n' , ii , config.numFovs)    
        numFrames = size( beamshapeCorrection.cam0{ii}, 3);
        
        % Note: we skip the first frame in the analysis, because this is
        % noise in our analysis.
        for j = 2:2%numFrames
        
            cam0 = beamshapeCorrection.cam0{ii}(:,:,j);
            %cam1 = beamshapeCorrection.cam1{ii}(:,:,j);
            spotFinder{ii}.cam0 = SpotFinder( config ,double(cam0), ...
                'diameterThreshold', config.diameterThreshold);
        
        end
        
    output.spotFinder = spotFinder;
    end
    
    
end

