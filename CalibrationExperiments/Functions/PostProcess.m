function [ output ] = PostProcess( config, analysis )
    % Post Process - Performs the post processing
    %   Detailed explanation goes here

    
    intensities = analysis.stats.roi.meanIntensity;
    
    levels = cell( 1,config.numRois);
    steps= cell( 1,config.numRois);
    allLevels = [];
    allSteps = [];
    
    
    for ii = 51:61
        intensity = intensities( ii, :);
        figure;
        findchangepts( intensity, 'MinThreshold', 5e4, 'Statistic', 'mean');
    end
    
    for ii = 81:91
        intensity = intensities( ii, :);
        figure;
        findchangepts( intensity, 'MinThreshold', 5e4, 'Statistic', 'mean');
    end
    
    for ii = 1:config.numRois
        
        intensity = intensities( ii, :);
        
        pts = findchangepts( intensity, 'MinThreshold', 5e4, 'Statistic', 'mean');

        numPts= length( pts);
        
        levels{ii} = zeros( 1, numPts);
        levels{ii}(1) = mean( intensity( 1:(pts(1)-1) ));
        levels{ii}(numPts+1) = mean( intensity( pts(numPts):config.numFrames ));
        
        for j = 1:(numPts-1)
            levels{ii}(j+1) = mean( intensity( pts(j) : (pts(j+1)-1) ));
        end
            
        levels{ii} = round(levels{ii});
        steps{ii} = diff( -levels{ii});
        steps{ii} = steps{ii}( steps{ii}>0);
        
        allLevels = [ allLevels, levels{ii}];
        allSteps = [ allSteps, steps{ii}];
    end
    
   plotTitle = 'Intensity distribution of Photobleaching Steps';
   figure; histogram( allSteps, 50); title( plotTitle)
   ylabel('Counts'); xlabel('StepSize')
%     
%    GaussianMleFit( allSteps, [0, 700], 50, plotTitle)
    
    output.levels = levels;
    output.steps = steps;
    output.allSteps = allSteps;
    output.allLevels = allLevels;
    
end
