function [ output ] = PostProcess( config, analysis)
    % Post Process - Performs the post processing.
    
    for ii = 1:config.numFovs
        
        numSpots = size( analysis.stats{ii}.roi.averageIntensity, 1);
        numFrames = size( analysis.stats{ii}.roi.averageIntensity, 2);

        % Compute normalized global statistics
        averageGlobalIntensity = analysis.stats{ii}.global.averageIntensity(:,:);
        medianGlobalIntensity = analysis.stats{ii}.global.medianIntensity(:,:);
        
        if ii == 4
            numFrames = 45;
            averageGlobalIntensity = analysis.stats{ii}.global.averageIntensity(:,1:45);
            medianGlobalIntensity = analysis.stats{ii}.global.medianIntensity(:,1:45);    
        end
        normMedianGlobalIntensity = medianGlobalIntensity/ medianGlobalIntensity(1);
        normMeanGlobalIntensity = averageGlobalIntensity/ averageGlobalIntensity(1);
        
        
        % Compute normalized roi statistics
        averageRoiIntensities = analysis.stats{ii}.roi.averageIntensity(:,:);
        if ii == 4
            averageRoiIntensities = analysis.stats{ii}.roi.averageIntensity(:,1:45);
        end
        normRoiIntensities = averageRoiIntensities./ averageRoiIntensities(:,1);
        
        
        % Extra statistics!
        summedRoiIntensities = mean(normRoiIntensities, 1);
        correctedRoiIntensities = normRoiIntensities./ normMeanGlobalIntensity;
        
    output.stats{ii}.global.median = medianGlobalIntensity;
    output.stats{ii}.global.mean = averageGlobalIntensity;
    output.stats{ii}.global.normMedian = normMedianGlobalIntensity;
    output.stats{ii}.global.normMean = normMeanGlobalIntensity;
    output.stats{ii}.roi.normMean = normRoiIntensities;
    output.stats{ii}.roi.mean = averageRoiIntensities;
    output.results{ii}.test = summedRoiIntensities;
    output.results{ii}.corrected = correctedRoiIntensities;
    output.numFrames{ii} = numFrames;
    output.numSpots{ii} = numSpots;
    end

    PostVisualisation( config, output)
end

