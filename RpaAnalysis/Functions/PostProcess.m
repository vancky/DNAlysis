function [ output ] = PostProcess( config, analysis)
    % Post Process - Performs the post processing.
    
    for ii = 1:config.numFovs
        
        numSpots = size( analysis.stats{ii}.roi.meanIntensity, 1);
        numFrames = size( analysis.stats{ii}.roi.meanIntensity, 2);

        % Compute normalized global statistics
        meanGlobalIntensity = analysis.stats{ii}.global.meanIntensity(:,:);
        medianGlobalIntensity = analysis.stats{ii}.global.meanIntensity(:,:);
        normMedianGlobalIntensity = medianGlobalIntensity/ medianGlobalIntensity(1);
        normMeanGlobalIntensity = meanGlobalIntensity/ meanGlobalIntensity(1);
        
        % Compute normalized roi statistics
        meanRoiIntensities = analysis.stats{ii}.roi.meanIntensity(:,:);
        normRoiIntensities = meanRoiIntensities./ meanRoiIntensities(:,1);
        
        % Extra statistics!
        summedRoiIntensities = mean(normRoiIntensities, 1);
        correctedRoiIntensities = normRoiIntensities./ normMeanGlobalIntensity;
        
        % Max Intensity statistics 
        
        maxIntensityNorm = analysis.stats{ii}.roi.maxIntensity - ...
                            analysis.stats{ii}.roi.maxIntensity(:,1);
                        
        output.stats{ii}.global.median = medianGlobalIntensity;
        output.stats{ii}.global.mean = meanGlobalIntensity;
        output.stats{ii}.global.normMedian = normMedianGlobalIntensity;
        output.stats{ii}.global.normMean = normMeanGlobalIntensity;

        output.stats{ii}.roi.normMean = normRoiIntensities;
        output.stats{ii}.roi.mean = meanRoiIntensities;
        output.stats{ii}.roi.normMax = maxIntensityNorm;
        output.stats{ii}.roi.max = analysis.stats{ii}.roi.maxIntensity;

        output.results{ii}.test = summedRoiIntensities;
        output.results{ii}.corrected = correctedRoiIntensities;
        output.numFrames{ii} = numFrames;
        output.numSpots{ii} = numSpots;
    end

    PostVisualisation( config, output)
end

