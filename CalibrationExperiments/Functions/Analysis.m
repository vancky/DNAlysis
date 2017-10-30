function [ config, output ] = Analysis( config, inputImages )
    % ANALYSIS Summary of this function goes here
    %   Detailed explanation goes here

    for ll = 1: config.numFovs
        imagesFov = inputImages{ll};
        % This section finds the center coordinates of the ROIS 

        startImage = double( imagesFov(:,:,1));
        spotFinder = SpotFinder( startImage, ...
            'fitSize', config.fitSize, ...
            'mexiHatSigma', config.mexiHatSigma, ...
            'diameterThreshold', config.diameterThreshold, ...
            'eccentricityThreshold', config.eccentricityThreshold, ...
            'medianThreshold' , config.medianThreshold );
        SpotFinderVisualisation( config, startImage, spotFinder.circle, []);
        fitHelicases = FitHelicases( config, spotFinder.spots, ...
                                        spotFinder.centersFormatted);

        % This section evaluates every frame.

        roiLocations = CentersToCoordinates( fitHelicases.fitPosition, config.roiSize);
        numRois = size( roiLocations, 1);
        
        % Initialise zeros matrices
        stats.roi.meanIntensity = zeros( numRois, config.numFrames{ll});
        stats.roi.maxIntensity = zeros( numRois, config.numFrames{ll});
        stats.global.meanIntensity = zeros( 1, config.numFrames{ll});
        stats.global.medianIntensity = zeros( 1, config.numFrames{ll});
        
        for j = 1:config.numFrames{ll} 
            helicaseImage = double( imagesFov(:,:,j));

            for k = 1:numRois
                roiStats = RoiStats( helicaseImage, roiLocations(k,:));
                stats.roi.meanIntensity(k,j) = roiStats.intensity.mean;
                stats.roi.maxIntensity(k,j) = roiStats.intensity.max;
            end
            imageSize= [1, size(helicaseImage,2), 1, size(helicaseImage,1)];
            roiStats = RoiStats( helicaseImage, imageSize);
            stats.global.meanIntensity( 1, j) = roiStats.intensity.mean;
            stats.global.medianIntensity( 1, j) = roiStats.intensity.median;
        end
        
    
        stats.roi.meanIntensity = RemoveZeros( stats.roi.meanIntensity, 'row');
        stats.roi.maxIntensity = RemoveZeros( stats.roi.maxIntensity, 'row');
%         stats.roi.meanIntensity = stats.roi.meanIntensity;
%         stats.roi.maxIntensity = stats.roi.maxIntensity;

        config.numRois{ll} = size( stats.roi.meanIntensity, 1); 
        output.spotFinder{ll} = spotFinder;
        output.fitHelicases{ll} = fitHelicases;
        output.stats{ll} = stats;
        
    end
    
end

