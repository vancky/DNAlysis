function [ output ] = PostProcess( config, stats, iter )
    % Post Process - Performs the post processing
    %   Detailed explanation goes here
    
    numFrames = config.numFrames{iter};
    numRois = config.numRois{iter};
    maxIntensities = stats.roi.maxIntensity;
    meanIntensities = stats.roi.meanIntensity;
    
    % Initialize all cells and matrices
    levelsMax = cell( 1, numRois);
    stepsMax= cell( 1, numRois);
    levelsMean = cell( 1, numRois);
    stepsMean= cell( 1, numRois);
    allLevelsMax = [];
    allStepsMax = [];
    allLevelsMean = [];
    allStepsMean = [];
    
%     for ii = 10:14
%         maxIntensity = maxIntensities( ii, :);
%         figure;
%         findchangepts( maxIntensity, 'MinThreshold', 5e5, 'Statistic', 'mean');
%     end
%     
%     for ii = 31:35
%         maxIntensity = maxIntensities( ii, :);
%         figure;
%         findchangepts( maxIntensity, 'MinThreshold', 5e5, 'Statistic', 'mean');
%     end
%     
    idx = 0;
    for ii = 1:numRois
        
        maxIntensity = maxIntensities( ii, :);
        meanIntensity = meanIntensities( ii, :);
        
        pts = findchangepts( maxIntensity, 'MinThreshold', 5e5, 'Statistic', 'mean');

        numPts = length( pts);
        if numPts > 0
            idx = idx+1;

            levelsMax{idx} = zeros( 1, numPts);
            levelsMax{idx}(1) = mean( maxIntensity( 1:(pts(1)-1) ));
            levelsMax{idx}(numPts+1) = mean( maxIntensity( pts(numPts):numFrames));
            
            for j = 1:(numPts-1)
                levelsMax{idx}(j+1) = mean( maxIntensity( pts(j) : (pts(j+1)-1) ));
            end
            
            levelsMean{idx} = zeros( 1, numPts);
            levelsMean{idx}(1) = mean( meanIntensity( 1:(pts(1)-1) ));
            levelsMean{idx}(numPts+1) = mean( meanIntensity( pts(numPts):numFrames ));
            
            for j = 1:(numPts-1)
                levelsMean{idx}(j+1) = mean( meanIntensity( pts(j) : (pts(j+1)-1) ));
            end

            levelsMax{idx} = round(levelsMax{idx});
            stepsMax{idx} = abs( diff( levelsMax{idx}));
            levelsMean{idx} = round(levelsMean{idx});
            stepsMean{idx} = abs( diff( levelsMean{idx}));
            
            % Get all the levels and steps in one vector
            allLevelsMax = [ allLevelsMax, levelsMax{idx}];
            allStepsMax = [ allStepsMax, stepsMax{idx}];
            allLevelsMean = [ allLevelsMean, levelsMean{idx}];
            allStepsMean = [ allStepsMean, stepsMean{idx}];
            
        end
    end
    
    plotTitle = 'Intensity distribution of Photobleaching Steps (max value)';
    figure; histogram( allStepsMax, 20); title( plotTitle)
    ylabel('Counts'); xlabel('StepSize')

    plotTitle = 'Intensity distribution of Photobleaching Steps (mean value)';
    figure; histogram( allStepsMean, 20); title( plotTitle)
    ylabel('Counts'); xlabel('StepSize')
    %GaussianMleFit( allSteps, [0, 700], 50, plotTitle)
    
    output.levelsMax = levelsMax;
    output.stepsMax = stepsMax;
    output.allStepsMax = allStepsMax;
    output.allLevelsMax = allLevelsMax;
    
    output.levelsMean = levelsMean;
    output.stepsMean = stepsMean;
    output.allStepsMean = allStepsMean;
    output.allLevelsMean = allLevelsMean;
    
end

