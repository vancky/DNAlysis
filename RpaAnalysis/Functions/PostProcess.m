function [ output ] = PostProcess( config, analysis)
    % Post Process - Performs the post processing.
    
    for ii = 1:config.numFovs
        
        numSpots = size( analysis.stats{ii}.roi, 1);
        numFrames = size( analysis.stats{ii}.roi, 2);

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
        
        pause(1)
        % Visualize global statistics
        hold on
        plot( 1:numFrames, normMeanGlobalIntensity, 1:numFrames, normMedianGlobalIntensity)
        hold off
        title('Intensity over time for the total image')
        xlabel('Number of frames')
        ylabel('Normalized Pixel Counts')
        legend('Average value', 'Median value')

        
        % Visualize local statistics
        figure;
        title('Intensity over time for different ROIs')
        xlabel('Number of frames')
        ylabel('Normalized pixel counts')
        
        hold on
        for j = 1:numSpots
            plot( 1:numFrames, averageRoiIntensities(j,:), '--')
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
    
    output.stats{ii}.global.median = medianGlobalIntensity;
    output.stats{ii}.global.mean = averageGlobalIntensity;
    output.stats{ii}.global.normMedian = normMedianGlobalIntensity;
    output.stats{ii}.global.normMean = normMeanGlobalIntensity;
    output.stats{ii}.roi.normMean = normRoiIntensities;
    output.stats{ii}.roi.mean = averageRoiIntensities;
    output.results{ii}.test = summedRoiIntensities;
    output.results{ii}.correctedIntensities = correctedRoiIntensities;
    end
    
    for ii = 1:4; 
        figure;
        title('Intensity over time for the total image')
        xlabel('Number of frames')
        ylabel('Normalized Pixel counts')
        numFrames = size(postProcess.stats{ii}.roi.mean,2);
        numSpots = size( postProcess.stats{ii}.roi.mean ,1 );
        hold on
        plot( 1:numFrames, postProcess.stats{ii}.global.mean, 1:numFrames, postProcess.stats{ii}.global.median)
        legend( 'Mean intensity', 'Median Intensity')
        hold off; end
    
    for ii = 1:4; figure;
        title('Normalised intensity over time for different ROIs')
        xlabel('Number of frames')
        ylabel('Normalised Pixel counts')
        numFrames = size(postProcess.stats{ii}.roi.mean,2);
        numSpots = size( postProcess.stats{ii}.roi.mean ,1 );
        hold on
        for j = 1:numSpots
            plot( 1:numFrames, postProcess.stats{ii}.roi.normMean(j,:))
        end
        hold off; end
end

