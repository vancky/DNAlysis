function [ output_args ] = Visualisation( rollingBallFilter, clean , config )
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
    
    
end

