function [ output_args ] = Visualisation( rollingBallFilter, clean , config , finalImage, finalImageInverted )
    N=config.numStacks;
    originalImage=0;
    newImage=0;
    for i=1:N
        originalImage=originalImage+rollingBallFilter.image{i};
        newImage=newImage+clean{i}.imageGaussian;
    end

    figure;
    
    subplot(1,2,1), imshow(originalImage,[]), title('Original Image (with rolling ball filter)')
    subplot(1,2,2), imshow(newImage, []), title('Original Image after CLEAN algorithm')
    
    
    figure; 
    subplot(1,2,1), imshow(finalImage, []), title('Lucky Imaging smaller than threshold')
    subplot(1,2,2), imshow(finalImageInverted,[]), title('Lucky Imaging larger than threshold') 
    
    figure; 
    subplot(1,2,1), imshow(newImage, []), title('Image after clean algorithm')
    subplot(1,2,2), imshow(finalImageInverted,[]), title('Image after (inverse) lucky algorithm') 
    
end

