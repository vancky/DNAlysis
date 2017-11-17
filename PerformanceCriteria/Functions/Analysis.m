function [ output ] = Analysis( config, inputImages )
    % Analysis - Performs the analysis for the performance criteria
       
    for ii = 1:config.numReferenceSets
        
        helicaseImages = inputImages{ii}.helicaseImage;
        dnaImages = inputImages{ii}.dnaImage;
 
        % Performs the actual analysis
        helicaseAnalysis = HelicaseAnalysis( config, helicaseImages, ii);
        dnaAnalysis= DnaAnalysis( config, dnaImages);
        
        % Saves the results in an array format
        helicaseLocation{ii} = helicaseAnalysis.helicaseLocation;
        dnaRoiEstimated{ii} = dnaAnalysis.dnaRoi;
        stats{ii} = helicaseAnalysis.stats;
    end
    
    output.helicaseLocation = helicaseLocation;
    output.dnaRoiEstimated = dnaRoiEstimated;
    output.helicaseStats = stats;
end

