function [ output ] = Analysis( config, beamshapeCorrection )
    % Analysis - Detects the relevant region of interests
    %   Detailed explanation goes here
    
    for ii = 1:config.numFovs
        fprintf('Data analysis progress %i/%i.\n' , ii , config.numFovs)    
        numFrames = size( beamshapeCorrection.cam0{ii}, 3);
        
        
        % This section finds the center coordinates of the ROIS
        cam0Start = double( beamshapeCorrection.cam0{ii}(:,:,5));
        spotFinder{ii}.cam0 = SpotFinder( cam0Start, ...
            'fitSize', config.fitSize, ...
            'mexiHatSigma', config.mexiHatSigma.cam0, ...
            'diameterThreshold', config.diameterThreshold.cam0, ...
            'eccentricityThreshold', config.eccentricityThreshold, ...
            'medianThreshold', config.medianThreshold.cam0 );
        SpotFinderVisualisation( cam0Start, spotFinder{ii}.cam0.circle, []);
        fitHelicases{ii}.cam0 = FitHelicases( config, ...
                spotFinder{ii}.cam0.spots, spotFinder{ii}.cam0.centersFormatted);

        % This section evaluates every frame.
        % Note: we skip the first frames in the analysis, because this is
        % noise in our analysis.
        
        roiLocations = CentersToCoordinates( fitHelicases{ii}.cam0.fitPosition, config.roiSize);
        numRois = length( roiLocations);
        
        idx = 0;
        for j = 5:numFrames 
            idx= idx + 1;
            cam0 = double( beamshapeCorrection.cam0{ii}(:,:,j));
            %cam1 = beamshapeCorrection.cam1{ii}(:,:,j);
            
            for k = 1:numRois
                roiStats = RoiStats( cam0, roiLocations(k,:));
                stats{ii}.roi.meanIntensity(k,idx) = roiStats.intensity.mean;
            end
            cam0Size= [1, size(cam0,2), 1, size(cam0,1)];
            roiStatsGlobal = RoiStats( cam0, cam0Size);
            stats{ii}.global.meanIntensity(idx) = roiStatsGlobal.intensity.mean;
            stats{ii}.global.medianIntensity(idx) = roiStatsGlobal.intensity.median;
        end
    end
    
    output.spotFinder = spotFinder;
    output.fitHelicases = fitHelicases;
    output.stats = stats;
    
end

