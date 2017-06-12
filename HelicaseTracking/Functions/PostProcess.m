function [ output ] = PostProcess( config, matchDnaHelicase , helicaseIntensity )
    % Post Processing - Performs post data analysis
    %   Detailed explanation goes here
    
    matchCount = 0;
    N = config.numFovs;
    intensity = [];
    for ii = 1:N
        matchCount = matchCount + matchDnaHelicase{ii}.match;
        intensity = [ intensity , helicaseIntensity{ii}.intensity'];
        
        
    end
    
    matchTotal = matchCount/N;
    output.match = matchTotal;
    output.intensity = intensity;
    
    fprintf('The total fraction of helicases located on the DNA is %.2f .\n' , matchTotal)
    
    figure;
    histogram( intensity , 200 , 'BinLimits' , [1 2e4])    
    title('Intensity Distribution of Helicases')
    xlabel('Pixel counts per Helicase')
    ylabel('Number of helicases')
end

