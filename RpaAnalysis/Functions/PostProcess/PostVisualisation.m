function [ ] = PostVisualisation( config, postProcess )
    % Post Visualisation - visualizes results of post processing

    for kk = 1:config.numFovs
        
        numFrames = postProcess.numFrames{kk};
        numSpots = postProcess.numSpots{kk};
        
        % Visualize global statistics 
%         y1 = postProcess.stats{kk}.global.mean;
%         y2 = postProcess.stats{kk}.global.median;
%         figure;
%         hold on
%         plot( 1:numFrames, y1, 1:numFrames, y2)
%         hold off
%         title('Intensity over time for the total image')
%         xlabel('Number of frames')
%         ylabel('Pixel Counts')
%         legend('Average value', 'Median value')
%         
%         y1 = postProcess.stats{kk}.global.normMean;
%         y2 = postProcess.stats{kk}.global.normMedian;
%         figure;
%         hold on
%         plot( 1:numFrames, y1, 1:numFrames, y2)
%         hold off
%         title('Normalized intensity over time for the total image')
%         xlabel('Number of frames')
%         ylabel('Normalized Pixel Counts')
%         legend('Average value', 'Median value')
        
        % Visualize local statistics
        figure;
        title('Maximum pixel count over time normalized')
        hold on
        for j = 1:numSpots
            plot( 1:numFrames, postProcess.stats{kk}.roi.normMax(j,:))
        end
        hold off
        xlabel('Number of frames')
        ylabel('Normalized pixel counts')
        
        
        % Visualise corrected statistics
        figure; 
        title('Maximum pixel count over time averaged')
        xlabel('Number of frames')
        ylabel('Normalized Pixel Counts')
        hold on
        averageIntensity = mean(postProcess.stats{kk}.roi.normMax, 1);
        for j = 1:numSpots
            plot( 1:numFrames, averageIntensity)
        end
        hold off
    end

end

