function [ output ] = PostProcess( config, matchDnaHelicase , helicaseIntensity , spotFinder )
    % Post Processing - Performs post data analysis
    % Computes total number of spots, the fraction of helicases overlapping
    % with the dna and a histogram of the intensity of all helicases.
    
    N = config.numFovs;
    % Initialize the sums for the for loop
    numSpots = 0;
    count = 0;
    intensity = [];
    match = zeros(N,1);
    
    for ii = 1:N
        numSpots = numSpots + spotFinder{ii}.numSpots;
        count = count + matchDnaHelicase{ii}.count;
        match(ii,1) = matchDnaHelicase{ii}.match;
        intensity = [ intensity , helicaseIntensity{ii}.intensity'];
    end
    
    matchTotal = count/numSpots;
    output.match = matchTotal;
    output.intensity = intensity;
    
    matchStd = sqrt(sum((match-matchTotal).^2 )/(N-1));
    output.std = matchStd ; 
    
    fprintf('The total fraction of helicases located on the DNA is %.2f .\n' , matchTotal)
    fprintf('The standard deviation of the helicase fraction is %.3f .\n' , matchStd)
    
    figure;
    histogram( intensity , 200 , 'BinLimits' , [1 1e4])    
    title('Intensity Distribution of Helicases')
    xlabel('Pixel counts per Helicase')
    ylabel('Number of helicases')
end

