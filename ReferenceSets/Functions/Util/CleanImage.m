function [ outputImage ] = CleanImage( inputImage, cr, backgroundOption )
    % Clean a Helicase Image using predefined cleaning regions

    % Initialize a test image with background noise
    testImage = ones(size(inputImage))*median(inputImage(:));

    % Manually clean the images  
    numRegions = size(cr,1);
    for i =1:numRegions
        testImage( cr(i,2):cr(i,4), cr(i,1):cr(i,3) ) = ...
            inputImage( cr(i,2):cr(i,4), cr(i,1):cr(i,3) );
    end
    
    
    switch backgroundOption 
        case 'true'
            % Use a rolling background of the original image
            cleanedImage = BallSmooth( inputImage, 50);
            cleanedImage = BallSmooth( cleanedImage, 35);
            cleanedImage = BallSmooth( cleanedImage, 25);
        case 'minimum'
            % Otherwise, initialize the real cleaned image with the mimnimum 
            cleanedImage = ones(size(inputImage))* min(testImage(:));    
        otherwise
            fprintf('Please specify a correct background option for cleaning the image')
    end
    
    for i =1:numRegions
        cleanedImage( cr(i,2):cr(i,4), cr(i,1):cr(i,3) ) = ...
            inputImage( cr(i,2):cr(i,4), cr(i,1):cr(i,3) );
    end
    
    filteredImage = BackgroundFilterNoScale( cleanedImage);
    outputImage = filteredImage;
end

