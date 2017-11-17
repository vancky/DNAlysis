function [ output ] = DnaFinderWatershed( inputImage, varargin )
    % Dna Finder Watershed - Finds DNA inspired by SpotFinders watershed.
    %   Detailed explanation goes here

    % Parses the optional input arguments
    p = inputParser;
    
    addOptional( p, 'mexiHatSigma', 1);
    %addOptional( p, 'diameterThreshold', 0);
    %addOptional( p, 'eccentricityThreshold', 1);
    %addOptional( p, 'medianThreshold', 1.1);
    
    parse( p, varargin{:})

    % Smooths the image so that it is ready for watershedding
    filter = GenerateMexicanHat( p.Results.mexiHatSigma);
    smoothImage = inputImage; %imfilter( inputImage, filter, 'symmetric');
    
    % Performs the watershed algorithm  
    
    watershedImage = WatershedImage( smoothImage);

    figure;
    subplot(1,2,1); imshow( inputImage, []); title('Input Image')
    subplot(1,2,2); imshow( smoothImage, []); title('Smoothed Image')
    
    output.smoothImage = smoothImage;


end

