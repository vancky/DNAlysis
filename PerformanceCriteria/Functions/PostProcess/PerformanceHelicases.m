function [ output ] = PerformanceHelicases( referenceLocations, helicaseLocations )
    % Performance Helicases - Evaluates the performance criteria for the
    % helicase images

    numImages = length( helicaseLocations);
    
    for ii = 1:numImages
        referenceLocation = referenceLocations{ii};
        helicaseLocation = helicaseLocations{ii};
        
        numHelicasesReference= length( referenceLocation);
        numHelicasesFound = length( helicaseLocation);
        
        correctCount = 0;
        incorrectCount = 0;
        
        for jj = 1:numHelicasesFound
            location = helicaseLocation( jj, :);
            difference = referenceLocation - location;
            
            distances = sqrt( sum( difference.^2, 2));
            minDistance = min( distances);
            
            if minDistance < 2
                correctCount = correctCount + 1;
            else
                incorrectCount = incorrectCount + 1;
            end  

        end
        
%         for jj = 1:numHelicasesReference
%             correctLocation = referenceLocation( jj, :);
%             difference = helicaseLocation - correctLocation;
%             
%             distances = sqrt( sum( difference.^2, 2));
%             minDistance = min( distances);
%             if minDistance < 2
%                 correctCount = correctCount + 1;
%             else
%                 incorrectCount = incorrectCount + 1;
%             end  
% 
%         end
        
        trackingSucces(ii) = correctCount / numHelicasesReference;
        trackingError(ii) = (numHelicasesFound-correctCount) / numHelicasesReference;
    end
    
    output.trackingSucces = trackingSucces;
    output.trackingError = trackingError;    
    
    output.trackingSuccesAvg = mean( trackingSucces);
    output.trackingErrorAvg = mean( trackingError);
    
end

