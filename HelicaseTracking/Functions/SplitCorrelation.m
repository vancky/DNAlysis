function [ output ] = SplitCorrelation( config, inputImage )
    % Split Correlation - Correlates one matrix containing two split images
    % 1. Determine which part is the left and right image
    % 2. Create two individual images
    % 3. Correlate these images to find the correct position
    
    % Split the image
    
    % Number of rows and columns in the input image
    numRows=size(inputImage,2);
    numColumns=size(inputImage,2);
    % Number of rows  and columns in the split images
    halfRow=numRows;
    halfCol=numColumns/2;
    
    
    output.leftImage=inputImage(:,1:halfCol);
    output.rightImage=inputImage(:,halfCol+1:2*halfCol);
        
    output.correlation=conv2(output.leftImage,output.rightImage,'same');
    [maxValue , output.maxIndex]=max(output.correlation(:));
    [output.rowIndex, output.colIndex] = ind2sub(size(output.correlation),output.maxIndex);
    
    rowCorrection=output.rowIndex-halfRow/2;
    colCorrection=output.colIndex-halfCol/2;
    
    output.leftImageCorrected=output.leftImage;
    for i=1:halfCol-colCorrection
        output.rightImageCorrected(:,i+colCorrection)=(output.rightImage(:,i));
        output.rightImageCorrected(:,1:colCorrection)=0;
    end
    for j=1:halfRow-rowCorrection
        output.rightImageCorrected(i+rowCorrection,:)=(output.rightImageCorrected(j,:));
        output.rightImageCorrected(1:rowCorrection,:)=0;
    end
    
    % Compare the non correlated and correlated images
    
    figure;
    subplot(1,2,1); CompareSplit(output.leftImage, output.rightImage, 10); title('No correlation')
    subplot(1,2,2); CompareSplit(output.leftImageCorrected, output.rightImageCorrected, 10); title('With correlation')

end

