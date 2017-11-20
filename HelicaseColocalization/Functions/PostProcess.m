function [ output ] = PostProcess( config, analysis)
    %POSTPROCESS Summary of this function goes here
    %   Detailed explanation goes here

    dist = []; 
    distRandom = []; 
    
    % Get all FOV distances in one big vector
    for i = 1:6
        dist= [ dist, analysis.matchHelicases{i}.dist];
        distRandom = [ distRandom, analysis.matchHelicases{i}.distRandom]; 
    end

    % Convert distance to nanometers
    dist = dist * (config.pixelSize*1e9); 
    distRandom = distRandom *(config.pixelSize*1e9); 
    
    % Small edge plots
    figure; 
    histogram( dist*1e-3, 20, 'Normalization', 'probability');
    xlabel('Distance (um)', 'FontSize', 14); ylabel('Probability', 'FontSize', 14);
    figure;
    histogram( distRandom*1e-3, 20, 'Normalization', 'probability');
    xlabel('Distance (um)', 'FontSize', 14); ylabel('Probability', 'FontSize', 14);
    
    % Full spectrum plots
    figure; 
    histogram( dist, 20, 'Normalization', 'probability','BinLimits', [0 800]);
    xlabel('Distance (nm)', 'FontSize', 14); ylabel('Probability', 'FontSize', 14); ylim([0 7e-4]);
    figure;
    histogram( distRandom, 20, 'Normalization', 'probability','BinLimits', [0 800]);
    xlabel('Distance (nm)', 'FontSize', 14); ylabel('Probability', 'FontSize', 14); ylim([0 7e-4]);
    
    output.dist = dist;
    output.distRandom = distRandom;

end

