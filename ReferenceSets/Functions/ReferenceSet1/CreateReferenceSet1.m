function [ output ] = CreateReferenceSet1( config )
    % Create Reference Set 1
    
    
    % Imports the relevant bead image for reference set 1
    fprintf('Importing images for reference set 1.\n')
    beadImage = ImportOneCamera( config.referenceSet1Cd , 'stack' );
    fprintf('Images for reference set 1 have been imported.\n')
    
    
    % Crop the image to a region which you like
    croppedImage = beadImage{1}(:, 45:241);
    
    % Initialize a cleaned image
    cleanedImage = zeros(size(croppedImage));
    
    % Define cleanregions [ XTL, YTL, XBR, YBR]
    % Where TL is top left and BR is bottom right
    cr(1,:)= [90, 228, 108, 243];
    cr(2,:)= [103, 17, 121, 32];
    cr(3,:)= [41, 58, 53, 68];
    
    % Manually clean the images
    
    numRegions = size(cr,1);
    for i =1:numRegions
        cleanedImage( cr(i,2):cr(i,4), cr(i,1):cr(i,3) ) = ...
            croppedImage( cr(i,2):cr(i,4), cr(i,1):cr(i,3) );
    end
    
    
    output = beadImage{1};
    
    figure;
    imshow( beadImage{1} , [100 150]);
    figure;
    imshow(croppedImage, [100 150])
    figure;
    imshow(cleanedImage, [100 150])
    
end

