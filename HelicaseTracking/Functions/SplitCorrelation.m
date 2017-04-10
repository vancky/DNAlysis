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
     
    output.rightImageCorrected=output.rightImage;
    output.leftImageCorrected=zeros(size(output.leftImage));
    
    for i=1:halfCol     
        if i-colCorrection > 0
            output.leftImageCorrected(:, i-colCorrection )=(output.leftImage(:,i));
        else
            output.leftImageCorrected(:, halfCol-i+1)=0;
        end
    end
    for j=1:halfRow
        if j-rowCorrection > 0
            output.leftImageCorrected( j-rowCorrection ,:)=(output.leftImageCorrected(j,:));
        else
            output.leftImageCorrected( halfRow-j+1 ,:)=0;
        end
    end
    
    % Compare the non correlated and correlated images
    
    figure;
    subplot(1,2,1); CompareSplit(output.leftImage, output.rightImage, 10); title('No correlation')
    subplot(1,2,2); CompareSplit(output.leftImageCorrected, output.rightImageCorrected, 10); title('With correlation')

end

