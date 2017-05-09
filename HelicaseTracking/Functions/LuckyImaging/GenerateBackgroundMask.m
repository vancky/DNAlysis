function [ output ] = GenerateBackgroundMask( config , brightFinder , averageValue, loopImage )
    % Generate Background Mask - When a fit fails replaces the patch with
    % background
    %   Detailed explanation goes here
    
    rowMin= brightFinder.rowIndex - config.fitSize;
    rowMax = brightFinder.rowIndex + config.fitSize;
    
    colMin = brightFinder.colIndex - config.fitSize;
    colMax = brightFinder.colIndex + config.fitSize;
    
    
    % all the if statements are to make sure that we don't include stuff
    % that is off the edges.
    domainSize = brightFinder.imageSize;

    if rowMin < 1
        rowMin = 1;
    end
    
    if colMin < 1
        colMin = 1;
    end
    
    if rowMax > domainSize(1)
        rowMax = domainSize(1);
    end
    
    if colMax > domainSize(2)
        colMax = domainSize(2);
    end

    loopImage(  rowMin : rowMax , colMin : colMax) = averageValue;
    output = loopImage;

end

