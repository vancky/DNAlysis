function [ output ] = DnaAnalysis( config, dnaImages )
    % Dna Analysis - Analyses the DNA images of the Summary of this function goes here

    numDnaImages = length( dnaImages);

    if numDnaImages == 0
        output.dnaRoi{1} = [];
    else
        for jj = 1:numDnaImages
            dnaImage = double( dnaImages{jj});
            dnaFinder = DnaFinder( config, dnaImage);
            output.dnaRoi{jj}= dnaFinder.dnaRoi;
        end
    end
    
end

