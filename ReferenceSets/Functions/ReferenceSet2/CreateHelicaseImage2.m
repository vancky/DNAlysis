function [ output ] = CreateHelicaseImage2( helicaseImages )
    % Create Helicase Image 2
    % Creates the helicase image for reference set 2

    % Just do some manual cropping of the images
    
    numImages = size(helicaseImages,2);
    for i = 1: numImages
        croppedImage{i} = helicaseImages{i}(1:430, 35:245);
        filteredImage{i} = BackgroundFilterNoScale( croppedImage{i});
        cleaningCoordinates = GetHelicaseCleaningCoordinates2(i);
        cleanedImage{i} = CleanImage( filteredImage{i}, cleaningCoordinates);
    end

    output = cleanedImage;
    
    % This code can be uncommented to visualise the cropping
%     for i = 1:5
%         figure; 
%         subplot(1,2,1);
%         imshow( croppedImage{i}, [100 150]); colorbar;
%         title( sprintf('Cropped Image %i', i)); 
%         subplot(1,2,2);
%         imshow( helicaseImages{i}, [100 150]); colorbar;
%         title( sprintf('Helicase Image %i', i)); 
%     end
end

