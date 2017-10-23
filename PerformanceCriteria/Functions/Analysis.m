function [ output ] = Analysis( config, inputImages )
    % Analysis - Performs the analysis for the performance criteria
       
    for ii = 1:config.numReferenceSets
        
        helicaseImages = inputImages{ii}.helicaseImage;
        dnaImages = inputImages{ii}.dnaImage;
 
        % Performs the actual analysis
        helicaseLocation = HelicaseAnalysis( config, helicaseImages);
        dnaRoi = DnaAnalysis( config, dnaImages);
        
        % Saves the results in an array format
        helicaseLocation{ii} = helicaseLocation;
        dnaRoiEstimated{ii} = dnaRoi;
    end
    
    output.helicaseLocation = helicaseLocation;
    output.dnaRoiEstimated = dnaRoiEstimated;

end

