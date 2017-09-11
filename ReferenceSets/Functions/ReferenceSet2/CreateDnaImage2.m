function [ output ] = CreateDnaImage2( dnaImages )
    % Create Dna Image 2 
    % Detailed explanation goes here

    numImages = length( dnaImages);
    for i = 1:numImages
        croppedImage{i} = dnaImages{i}( :, 270:495);
        filteredImage{i} = BackgroundFilterNoScale( croppedImage{i});
        
%         NEED TO IMPLEMENT A STEP HERE WHICH CORRECTS FOR UNEVEN BACKGROUND, 
%         SIMILAR TO PREPROCESS!!!! Otherwise the masking will not make sense.
        
        cleaningCoordinates = GetDnaCleaningCoordinates2(i);
        cleanedImage{i} = CleanImage( filteredImage{i}, cleaningCoordinates, 'true');
        smoothedImage{i} = imgaussfilt( cleanedImage{i}, 2);
    end
    
    output = smoothedImage;
end

