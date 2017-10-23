function [ output ] = PerformanceDna( referenceRois, estimatedRois)
    % Performance dna- Evaluates the performance criteria for the
    % dna images

    numImages = length( estimatedRois);
    
    for ii = 1:numImages
        estimatedRoi = estimatedRois{ii};
        referenceRoi = referenceRois{ii};
        
        totalPixels = numel( referenceRoi);
        referenceDnaPixels = sum( referenceRoi(:));
        referenceNoDnaPixels = totalPixels - referenceDnaPixels;
        
        correctPixelMap = estimatedRoi.*referenceRoi;
        incorrectPixelMap = estimatedRoi.*(~referenceRoi);
        
        correctPixels = sum( correctPixelMap(:));
        incorrectPixels = sum( incorrectPixelMap(:));
        
%         figure; 
%         subplot(1,3,1); imshow(~referenceRoi, []);
%         subplot(1,3,2); imshow( estimatedRoi, []);
%         subplot(1,3,3); imshow( incorrectPixelMap, []);
%         
        trackingFraction(ii) = (correctPixels+incorrectPixels)/ referenceDnaPixels;
        trackingSucces(ii) = correctPixels / referenceDnaPixels;
    end
    
    output.trackingFraction = trackingFraction;
    output.trackingSucces = trackingSucces;
    output.trackingFractionAvg = mean( trackingFraction);
    output.trackingSuccesAvg = mean( trackingSucces);
end

