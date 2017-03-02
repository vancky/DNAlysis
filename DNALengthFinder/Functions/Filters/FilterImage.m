function [ filterImage ] = FilterImage( inputImage,ballRad )
    %IMAGEFILTER Filters Images using roling ball and average value filter
    %Step 1 apply rolling ball (disk) filter
    %Step 2 apply avg filter on roll ball filt -> we do this to correct for
    %Poisson noise.

    %% Analysis
      %% Protocol 1

%     filterImage.ballFilter=BallFilter(inputImage,ballRad);
%     filterImage.sobelFilter=SobelFilter(filterImage.ballFilter.outputImage);
%     filterImage.sobelFilter1=SobelFilter(inputImage);  
%     filterImage.ballFilter1=BallFilter(filterImage.sobelFilter1.outputImageX, ballRad);  
%     
%     %OPTIONAL FOR VISUALISING RESULTS, REMOVE LATER
%     figure
%     subplot(2,2,1); imshow(inputImage,[]); title('input image')
%     subplot(2,2,2); imshow(filterImage.ballFilter.outputImage,[]); title('1. Rolling ball filter') 
%     subplot(2,2,3); imshow(filterImage.sobelFilter.outputImageX,[]); title('2. Sobel filterX') 
%     subplot(2,2,4); imshow(filterImage.ballFilter1.outputImage,[]); title('order reversed') 
    
    %% Protocol 2
    
%     filterImage.averageFilter=AverageFilter(inputImage);
%     filterImage.squareFilter=SquareFilter(filterImage.averageFilter.outputImage , 2 );
%     filterImage.ballFilter=BallFilter(filterImage.squareFilter.outputImage , ballRad);
%     filterImage.outputImage=filterImage.ballFilter;
%     
%     figure
%     subplot(2,2,1); imshow(inputImage,[]); title('input image')
%     subplot(2,2,2); imshow(filterImage.averageFilter.outputImage,[]); title('1. average filter') 
%     subplot(2,2,3); imshow(filterImage.squareFilter.outputImage,[]); title('2. Square average filter') 
%     subplot(2,2,4); imshow(filterImage.ballFilter.outputImage,[]); title('3. Another rolling ball filter') 

    %% Protocol 3
    
    filterImage.gaussianFilter=GaussianFilter(inputImage, 11, 5, 6, 3, 4, 2);
    filterImage.averageFilter=AverageFilter(filterImage.gaussianFilter.outputImage);
    %filterImage.gaussianFilter=GaussianFilter(filterImage.averageFilter.outputImage, 11, 5, 6, 3, 4, 2);
    filterImage.outputImage=filterImage.averageFilter;
end

