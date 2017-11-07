function [ output ] = RoiStats( inputImage, roiLocation)
    % Roi Intensity - Gets the intensity of an area in an image
    % Give as inputs the image to be analysed and a vector with the
    % ROI location coefficients, [ xMin, xMax, yMin, yMax] 
    % The output is the average intensity over this area.

    xSize = size( inputImage, 2);
    ySize = size( inputImage, 1);
    
    xMin = roiLocation(1);
    xMax = roiLocation(2);
    yMin = roiLocation(3);
    yMax = roiLocation(4);   
    
    if (xMin >= 1) && (yMin >=1) && (xMax <= xSize) && (yMax <=ySize)
        roi = inputImage( yMin:yMax, xMin:xMax);
    else
        roi = [0];
    end
    
    
    totalIntensity = sum( roi(:));
    maxIntensity = max( roi(:)); 
    meanIntensity = totalIntensity/ numel(roi);
    medianIntensity = median( roi(:));
    
    output.intensity.max = maxIntensity;
    output.intensity.mean = meanIntensity;
    output.intensity.median = medianIntensity;
    output.image = roi;
end

