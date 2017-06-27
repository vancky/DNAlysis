function [ output ] = CountDna( config , dnaImage , matchDnaHelicase )
    % Count Dna - Counts the amount of DNA strands on an image
    % Uses the intensity of the regions detected by the matchDnaHelicase
    % Function to compute the amount of DNA strands.

    % Filter the background from the image , use the new image as
    % calibration
    
    bg = median( dnaImage); 
    dnaImageFilter = max( dnaImage - bg , 0);
    
    % Find mean intensity of DNA regions
    
    cc = matchDnaHelicase.binaryDna;
    dnaPixelValues= regionprops( cc , dnaImageFilter , 'PixelValues');
    
    totalIntensity = 0;
    
    for ii = 1 : length( dnaPixelValues )
        intensity(ii) = sum( dnaPixelValues(ii).PixelValues );
        totalIntensity = totalIntensity + intensity(ii);
    end
    
    
    numDna = round( totalIntensity / config.dnaIntensity); 
    
    output.numDna = numDna;
    
end

