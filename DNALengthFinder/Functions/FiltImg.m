function [ ballAvgFilt ] = filtImg( loadImgOutput,ballRad )
    %IMAGEFILTER Filters Images using roling ball and average value filter
    %Step 1 apply rolling ball (disk) filter
    %Step 2 apply avg filter on roll ball filt -> we do this to correct for
    %Poisson noise.

    %% Analysis

    b=fspecial('disk', ballRad);

    avg=sum(sum(loadImgOutput,2))/numel(loadImgOutput);
    ballFilt= imfilter(loadImgOutput,b,'replicate');          %Step 1
    ballAvgFilt= ballFilt-(avg);                              %Step 2
end

