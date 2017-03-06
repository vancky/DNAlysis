function [ dnaFinder ] = DnaFinder( logicOutput, config )
    %DNAFINDER Finds strands of DNA based on connected region analysis
    %   bwconncomp finds groups of connected spots
    %   regionprops finds the area and eccentricity of these groups
    %   We assume DNA has a minimum area and eccentricity
    cc = bwconncomp(logicOutput); 
    stats = regionprops(cc, 'Area','Eccentricity','BoundingBox'); 
    idx = find( [stats.Area] > config.AreaThreshold & [stats.Eccentricity] > config.EccentricityThreshold); 
    dnaFinder.dna = ismember(labelmatrix(cc), idx);
    dnaFinder.allBoxes=regionprops(cc,'BoundingBox');
    dnaFinder.goodBoxes=dnaFinder.allBoxes(idx);
end

