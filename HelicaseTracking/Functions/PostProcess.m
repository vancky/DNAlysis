function [ output ] = PostProcess( config, matchDnaHelicase , helicaseIntensity , spotFinder )
    % Post Processing - Performs post data analysis
    % Computes total number of spots, the fraction of helicases overlapping
    % with the dna and a histogram of the intensity of all helicases.
    fprintf('Performing Post Processing .\n')
    
    N = config.numFovs;
    % Initialize the sums for the for loop
    numSpots = 0;
    count = 0;
    intensity = [];
    match = zeros(N,1);
    numSpotsArray = [];
    dnaFraction = [];
    
    for ii = 1:N
        numSpots = numSpots + spotFinder{ii}.numSpots;
        numSpotsArray = [ numSpotsArray , spotFinder{ii}.numSpots ];
        dnaFraction = [ dnaFraction , matchDnaHelicase{ii}.dnaFraction ];
        count = count + matchDnaHelicase{ii}.count;
        match(ii,1) = matchDnaHelicase{ii}.match;
        intensity = [ intensity , helicaseIntensity{ii}.intensity'];
    end
    output.intensity = intensity;
    output.dnaFraction = mean( dnaFraction );
    
    matchTotal = count/numSpots;
    output.match = matchTotal;
    output.intensity = intensity;
    
    matchStd = sqrt(sum((match-matchTotal).^2 )/(N-1));
    numSpotsStd = std(numSpotsArray);
    output.matchStd = matchStd ; 
    output.numSpotsStd = numSpotsStd;
    
    fprintf('The average number of spots per FOV is %.2f .\n' , numSpots/N)
    fprintf('The standard deviation of the number of spots per FOV is %.2f .\n' , numSpotsStd)
    fprintf('The total fraction of helicases located on the DNA is %.2f .\n' , matchTotal)
    fprintf('The standard deviation of the helicase fraction is %.3f .\n' , matchStd)
    fprintf('The average DNA fraction is %.2f .\n' , output.dnaFraction )
    
    figure;
    histogram( intensity , 100 , 'BinLimits' , [1 5e3])    
    title('Intensity Distribution of Helicases')
    xlabel('Pixel counts per Helicase')
    ylabel('Number of helicases')
end

