function [ DNA, goodBoxes ] = DnaFinder( logicOutput )
    %DNAFINDER Finds strands of DNA based on connected region analysis
    %   bwconncomp finds groups of connected spots
    %   regionprops finds the area and eccentricity of these groups
    %   We assume DNA has a minimum area and eccentricity
    cc = bwconncomp(logicOutput); 
    stats = regionprops(cc, 'Area','Eccentricity','BoundingBox'); 
    idx = find( [stats.Area] > 20 & [stats.Eccentricity] > 0.8); 
    DNA = ismember(labelmatrix(cc), idx);
    allBoxes=regionprops(cc,'BoundingBox');
    goodBoxes=allBoxes(idx);
end

