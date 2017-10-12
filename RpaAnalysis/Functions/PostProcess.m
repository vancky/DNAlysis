function [ output ] = PostProcess( config, analysis)
    % Post Process - Performs the post processing.
    
    
    
    for ii = 1:config.numFovs
        
        numSpots = size( analysis.stats{ii}.roi, 1);
        numFrames = size( analysis.stats{ii}.roi, 2);

        % Compute normalized global statistics
        averageGlobalIntensity = [analysis.stats{ii}.global.averageIntensity];
        medianGlobalIntensity = [analysis.stats{ii}.global.averageIntensity];
        normMedianGlobalIntensity = medianGlobalIntensity/ medianGlobalIntensity(1);
        normMeanGlobalIntensity = averageGlobalIntensity/ averageGlobalIntensity(1);

        % Compute normalized roi statistics
        averageRoiIntensities = [analysis.stats{ii}.roi.averageIntensity];
        size(averageRoiIntensities)
        size(analysis.stats{ii}.roi)
        averageRoiIntensities = reshape( averageRoiIntensities, size(analysis.stats{ii}.roi));
        normRoiIntensities = averageRoiIntensities./ averageRoiIntensities(:,1);
        
        % Visualize global statistics
        
        figure;
        title('Intensity over time for the total image')
        xlabel('Number of frames')
        ylabel('Normalized Pixel Counts')
        hold on
        plot( 1:numFrames, normMeanGlobalIntensity, 1:numFrames, normMedianGlobalIntensity)
        hold off
        legend('Average value', 'Median value')

        
        % Visualize local statistics
        figure;
        title('Intensity over time for different ROIs')
        xlabel('Number of frames')
        ylabel('Normalized pixel counts')
        hold on
        for j = 1:numSpots
            plot( 1:numFrames, normRoiIntensities(j,:))
        end
        hold off
        
        % Visualise corrected statistics
        figure;
        title('Corrected Intensity over time for different ROIs')
        xlabel('Number of frames')
        ylabel('Normalized Pixel Counts')
        hold on
        for j = 1:numSpots
            correctedRoiIntensity = normRoiIntensities(j,:)./ normMeanGlobalIntensity;
            plot( 1:numFrames, correctedRoiIntensity)
        end
        hold off
        
    end
end

