function [ output ] = CreateHelicaseRoiImage2( helicaseImages )
    % Create Helicase Roi Image 2
    % Creates the helicase image for reference set 2

    % Just do some manual cropping of the images
    
    numImages = size(helicaseImages,2);
    for i = 1: numImages
        croppedImage{i} = helicaseImages{i}(1:430, 35:245);
        filteredImage{i} = BackgroundFilterNoScale( croppedImage{i});
        cleaningCoordinates = GetHelicaseCleaningCoordinates2(i);
        cleanedImage{i} = CleanImage( filteredImage{i}, cleaningCoordinates, 'minimum');
    end

    output = cleanedImage;
    
end

