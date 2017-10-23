function [ config, output ] = Analysis( config, inputImages )
    % ANALYSIS Summary of this function goes here
    %   Detailed explanation goes here

    
    % This section finds the center coordinates of the ROIS 
    
    startImage = double( inputImages(:,:,1));
    spotFinder = SpotFinder( startImage, ...
        'meanThreshold' , config.meanThreshold, ...
        'diameterThreshold', config.diameterThreshold, ...
        'mexiHatSigma', config.mexiHatSigma, ...
        'eccentricityThreshold', config.eccentricityThreshold, ...
        'fitSize', config.fitSize);
    SpotFinderVisualisation( startImage, spotFinder.circle, []);
    fitHelicases = FitHelicases( config, spotFinder.spots, ...
                                    spotFinder.centersFormatted);

    % This section evaluates every frame.

    roiLocations = CentersToCoordinates( fitHelicases.fitPosition, config.roiSize);
    numRois = size( roiLocations, 1);

    for j = 1:config.numFrames 
        helicaseImage = double( inputImages(:,:,j));

        for k = 1:numRois
            roiStats = RoiStats( helicaseImage, roiLocations(k,:));
            stats.roi.meanIntensity(k,j) = roiStats.intensity.mean;
            stats.roi.maxIntensity(k,j) = roiStats.intensity.max;
        end
        imageSize= [1, size(helicaseImage,2), 1, size(helicaseImage,1)];
        roiStats = RoiStats( helicaseImage, imageSize);
        stats.global.meanIntensity(j) = roiStats.intensity.mean;
        stats.global.medianIntensity(j) = roiStats.intensity.median;
    end
    
    stats.roi.meanIntensity = RemoveZeros( stats.roi.meanIntensity, 'row');
    stats.roi.maxIntensity = RemoveZeros( stats.roi.maxIntensity, 'row');
    config.numRois = size( stats.roi.meanIntensity, 1); 
    output.spotFinder = spotFinder;
    output.fitHelicases = fitHelicases;
    output.stats = stats;
    
end

