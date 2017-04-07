function [ output ] = SplitCorrelation( config, inputImage )
    % Split Correlation - Correlates one matrix containing two split images
    % 1. Determine which part is the left and right image
    % 2. Create two individual images
    % 3. Correlate these images to find the correct position
    
    % Split the image
    
    numColumns=size(inputImage,2);
    halfCol=numColumns/2;
    output.leftImage=inputImage(:,1:halfCol);
    output.rightImage=inputImage(:,halfCol+1:2*halfCol);
    
    output.correlation=conv2(output.leftImage,output.rightImage,'same');
    [maxValue , output.maxIndex]=max(output.correlation(:));
    [output.rowIndex, output.colIndex] = ind2sub(size(output.correlation),output.maxIndex);
    
    
    % Compare the two images
    output.compare=CompareSplit(output.leftImage, output.rightImage, 20)
    
%     numColumns=size(image,2);
%     
%     for i=1 : (numColumns-1)
%         output.diff(:,i)=max(image(:,i+1)-image(:,i) , image(:,i)-image(:,i+1));
%     end
%     output.meanDiff=mean(output.diff,1);
end

