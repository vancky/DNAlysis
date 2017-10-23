function [ output ] = DnaAnalysis( config, dnaImages )
    % Dna Analysis - Analyses the DNA images of the Summary of this function goes here

    numDnaImages = length( dnaImages);

    if numDnaImages == 0
        dnaRoi{1} = [];
    else
        for jj = 1:numDnaImages
            dnaFinder = DnaFinder( config, dnaImages{jj});
            dnaRoi{jj}= dnaFinder.dnaRoi;
        end
    end
    
    output = dnaRoi;
end

