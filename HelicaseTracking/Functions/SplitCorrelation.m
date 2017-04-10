function [ output ] = SplitCorrelation( config, inputImage )
    % Split Correlation - Correlates one matrix containing two split images
    % 1. Split the image
    % 2. Correlate the image, find where correlation is maximal
    % 3. Perform correction based on this correlation
    
    % Split the image
    
    splitImage=SplitImage(inputImage ,1);
    output.leftImage=splitImage.leftImage;
    output.rightImage=splitImage.rightImage;
    
    %Dimensions of the splitted images, for further computations
    
    halfRow=size(inputImage,1);
    halfCol=size(inputImage,2)/2;
    
    % Perform the correlation    
        
    output.correlation=conv2(output.leftImage,output.rightImage,'same');
    
    % Find the index of maximum correlation
    
    [maxValue , output.maxIndex]=max(output.correlation(:));
    [output.rowIndex, output.colIndex] = ind2sub(size(output.correlation),output.maxIndex);  
    rowCorrection=output.rowIndex-halfRow/2;
    colCorrection=output.colIndex-halfCol/2;
     
    % Perform the correction
    
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
    blockSize=config.checkerBoardSize;           % blocksize for the checkerboard pattern
    subplot(1,2,1); CompareSplit(output.leftImage, output.rightImage, blockSize); title('No correlation')
    subplot(1,2,2); CompareSplit(output.leftImageCorrected, output.rightImageCorrected, blockSize); title('With correlation')

end

