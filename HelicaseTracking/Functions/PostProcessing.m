function [ output ] = PostProcessing( config, matchDnaHelicase )
    % Post Processing - Performs post data analysis
    %   Detailed explanation goes here
    
    matchCount = 0;
    N = config.numFovs;
    for ii = 1:N
        matchCount = matchCount + matchDnaHelicase{ii}.match;
    end
    
    matchTotal = matchCount/N;
    output.match = matchTotal;
    
    fprintf('The total fraction of helicases located on the DNA is %.2f .\n' , matchTotal)
    
end

