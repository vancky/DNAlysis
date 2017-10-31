function [ output ] = Analysis( config, inputImages)
    % Analysis - Detects the relevant region of interests
    %   Detailed explanation goes here
    
    for ii = 1:config.numFovs
        fprintf('Data analysis progress %i/%i.\n' , ii , config.numFovs)    
        numFrames = size( inputImages{ii}.cam0, 3);
        
        
        % This section finds the center coordinates of the ROIS
        cam0Start = double( inputImages{ii}.cam0(:,:,1));
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
        
        for j = 1:numFrames 
            cam0 = double( inputImages{ii}.cam0(:,:,j));
            %cam1 = beamshapeCorrection.cam1{ii}(:,:,j);
            
            roiCount = 0;
            for k = 1:numRois
                roiStats = RoiStats( cam0, roiLocations(k,:));
                
                if sum(sum(roiStats.image)) > 0
                    roiCount = roiCount + 1;
                    stats{ii}.roi.meanIntensity(roiCount,j) = roiStats.intensity.mean;
                    stats{ii}.roi.maxIntensity(roiCount,j) = roiStats.intensity.max;
                    roi{ii}(:,:,j,roiCount) = roiStats.image;
                end
            end
            cam0Size= [1, size(cam0,2), 1, size(cam0,1)];
            roiStatsGlobal = RoiStats( cam0, cam0Size);
            stats{ii}.global.meanIntensity(j) = roiStatsGlobal.intensity.mean;
            stats{ii}.global.medianIntensity(j) = roiStatsGlobal.intensity.median;
        end
        
    end
    
    output.spotFinder = spotFinder;
    output.fitHelicases = fitHelicases;
    output.stats = stats;
    output.roi = roi;
end

