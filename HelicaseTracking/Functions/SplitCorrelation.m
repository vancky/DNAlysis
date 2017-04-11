function [ output ] = SplitCorrelation( config, inputImage )
    % Split Correlation - Correlates one matrix containing two split images
    % 1. Split the image
    % 2. Correlate the image, find where correlation is maximal
    % 3. Perform correction based on this correlation
    
    % Split the image horizontal and get dimensions for later computations    
    
    splitImage=SplitImage(inputImage ,1);
    output.leftImage=splitImage.leftImage;
    output.rightImage=splitImage.rightImage;
    halfRow=size(output.leftImage,1);
    halfCol=size(output.leftImage,2);
    
    % Make a crop in the vertical direction for proper correlation
    output.croppedImage=output.rightImage( 1+halfRow/8 : 7*halfRow/8 , 1+halfCol/8:7*halfCol/8 );   
    cropsize=size(output.croppedImage);
    % Perform the correlation    
        
    output.correlation=xcorr2(output.croppedImage,output.leftImage);
    
    % Find the index of maximum correlation
    
    [maxValue , output.maxIndex]=max(output.correlation(:));
    [output.rowIndex, output.colIndex] = ind2sub(size(output.correlation),output.maxIndex);  
    rowCorrection=output.rowIndex-(halfRow+cropsize(1))/2+64;
    colCorrection=output.colIndex-(halfCol+cropsize(2))/2;
    
    % Perform the correction
    
    output.rightImageCorrected=output.rightImage;
    output.leftImageCorrected=zeros(size(output.leftImage));
    
%     for i=1:halfCol     
%         if i-colCorrection > 0
%             output.leftImageCorrected(:, i-colCorrection )=(output.leftImage(:,i));
%         else
%             output.leftImageCorrected(:, halfCol-i+1)=0;
%         end
%     end
%     for j=1:halfRow
%         if j-rowCorrection > 0
%             output.leftImageCorrected( j-rowCorrection ,:)=(output.leftImageCorrected(j,:));
%         else
%             output.leftImageCorrected( halfRow-j+1 ,:)=0;
%         end
%     end
    
    for i=1:halfCol
        for j=1:halfRow
            if (j+rowCorrection > 0 && j+rowCorrection<=config.pixels) && (i-colCorrection > 0 && i-colCorrection <=config.pixels)
                output.leftImageCorrected( j-rowCorrection ,i-colCorrection)=(output.leftImage(j,i));
            end
        end
    end
    
    % Compare the non correlated and correlated images
    
    figure;
    subplot(1,2,1); imshow(output.leftImage);   title('Left Image')
    subplot(1,2,2); imshow(output.rightImage);  title('Right Image')
    blockSize=config.checkerBoardSizeSplit;           % blocksize for the checkerboard pattern
    subplot(1,2,1); CompareSplit(output.leftImage, output.rightImage, blockSize); title('No correlation')
    subplot(1,2,2); CompareSplit(output.leftImageCorrected, output.rightImageCorrected, blockSize); title('With correlation')

end

