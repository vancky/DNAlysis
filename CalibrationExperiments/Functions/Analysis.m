function [ config, output ] = Analysis( config, inputImages )
    % ANALYSIS Summary of this function goes here
    %   Detailed explanation goes here

    
    % This section finds the center coordinates of the ROIS 
    
    startImage = double( inputImages(:,:,1));
    spotFinder = SpotFinder( config ,startImage, ...
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
            [meanIntensity, ~] = RoiIntensity( helicaseImage, roiLocations(k,:));
            stats.roi.meanIntensity(k,j) = meanIntensity;
        end
        imageSize= [1, size(helicaseImage,2), 1, size(helicaseImage,1)];
        [averageGlobalIntensity, medianGlobalIntensity] = RoiIntensity( helicaseImage, imageSize);
        stats.global.meanIntensity(j) = averageGlobalIntensity;
        stats.global.medianIntensity(j) = medianGlobalIntensity;
    end
    
    stats.roi.meanIntensity = RemoveZeros( stats.roi.meanIntensity, 'row');
    config.numRois = size( stats.roi.meanIntensity, 1); 
    output.spotFinder = spotFinder;
    output.fitHelicases = fitHelicases;
    output.stats = stats;
    
end
