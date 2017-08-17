function [ output ] = CreateHelicaseImage1( config )
    % Create Helicase Image 1
    % Creates the helicase image for reference set 1

    % Imports the relevant bead image for reference set 1
    fprintf('Importing the bead image for reference set 1.\n')
    beadImage = ImportOneCamera( config.referenceSet1Cd , 'stack' );
    fprintf('The bead image for reference set 1 has been imported.\n')
    
    % Crop the image to a region which you like
    croppedImage = beadImage{1}(:, 45:241);
    
    % Filter the image
    filteredImage = BackgroundFilterNoScale(croppedImage);
    
    % Initialize a cleaned image
    cleanedImage = zeros(size(filteredImage));
    
    % Define cleanregions [ XTL, YTL, XBR, YBR]
    % Where TL is top left and BR is bottom right
    
    cr(1,:)= [103, 17, 121, 32];
    cr(2,:)= [41, 58, 53, 68];
    cr(3,:)= [127, 101, 143, 115];
    cr(4,:)= [88, 134, 105, 150];
    cr(5,:)= [42, 166, 53, 176];
    cr(6,:)= [28, 175, 40, 186];
    cr(7,:)= [90, 228, 108, 243];
    cr(8,:)= [58, 233, 71, 244];
    cr(9,:)= [139, 252, 149, 261];
    cr(10,:)= [33, 258, 44, 268];
    cr(11,:)= [20, 279, 32, 288];
    cr(12,:)= [156, 317, 175, 334];
    cr(13,:)= [4, 338, 18, 350];
    cr(14,:)= [73, 353, 86, 365];
    cr(15,:)= [46, 431, 60, 443];
    cr(16,:)= [127, 430, 145, 446];
    cr(17,:)= [27, 14, 39, 24];
    cr(18,:)= [9, 104, 22, 115];
    cr(19,:)= [145, 106, 156, 117];
    cr(20,:)= [90, 257, 101, 265];
    
    % Manually clean the images
    
    numRegions = size(cr,1);
    for i =1:numRegions
        cleanedImage( cr(i,2):cr(i,4), cr(i,1):cr(i,3) ) = ...
            filteredImage( cr(i,2):cr(i,4), cr(i,1):cr(i,3) );
    end
    
    output = cleanedImage;
    
%     figure;
%     subplot(1,2,1); imshow( beadImage{1}(:, 1:256) , [100 150]); colorbar
%     title('Raw Image for Reference Set 1')
%     subplot(1,2,2); imshow(cleanedImage, [5 50]); colorbar
%     title('Cleaned Image Reference Set 1')
end

