function [ output ] = PostProcess( config, analysis)
    % Post Process - Performs the post processing.
    
    
    
    for ii = 1:config.numFovs
        
        numSpots = size( analysis.roiStatistics{ii}, 1);
        numFrames = size( analysis.roiStatistics{ii}, 2);

        averageGlobalIntensity = [analysis.globalStatistics{ii}.averageIntensity];
        medianGlobalIntensity = [ analysis.globalStatistics{ii}.medianIntensity];
        normMedianGlobalIntensity = medianGlobalIntensity/ medianGlobalIntensity(1);
        normMeanGlobalIntensity = averageGlobalIntensity/ averageGlobalIntensity(1);

        averageRoiIntensities = [analysis.roiStatistics{ii}(:,:).averageIntensity];

        
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
            averageRoiIntensity = averageRoiIntensities;
            normRoiIntensity = averageRoiIntensity/ averageRoiIntensity(1);

            if sum(averageRoiIntensity(j,:) > 0
                plot( 1:numFrames, normRoiIntensity)
            end
        end
        hold off
        
        % Visualise normalized statistics
        figure;
        title('Corrected Intensity over time for different ROIs')
        xlabel('Number of frames')
        ylabel('Normalized Pixel Counts')
        hold on
        for j = 1:numSpots
            averageRoiIntensity = [analysis.roiStatistics{ii}(j,:).averageIntensity];
            normRoiIntensity = averageRoiIntensity/ averageRoiIntensity(1);
            
            correctedRoiIntensity = normRoiIntensity./ normMeanGlobalIntensity;
            if sum(averageRoiIntensity(j,:)) > 0
                plot( 1:numFrames, correctedRoiIntensity)
            end
        end
        hold off
        
    end
end

