function [ output ] = CorrectCameraImagesNonLinear( config, alignedImages )
    % Align Camera Images Non Linear - Corrects images from cam0 and cam 1
    % which are shifted in a non-linear manner.
    % Detailed explanation goes here
    
    cam0 = alignedImages.cam0;
    cam1 = alignedImages.cam1;
    
    movingPoints = config.movingPoints;
    fixedPoints = config.fixedPoints;    
    tformPolynomial = fitgeotrans( movingPoints, fixedPoints, 'polynomial', 2);
    cam0Corrected = imwarp ( cam0, tformPolynomial, 'OutputView'  , imref2d( size( cam1)));
    output.cam0 = cam0Corrected;
    output.cam1 = cam1;
    
%     figure
%     subplot(1,3,1); imshow( cam0, [100 150]); title('Cam 0 Aligned');
%     subplot(1,3,2); imshow( cam0Corrected, [100 150]); title('Cam0 Corrected Polynomial 2');
%     subplot(1,3,3); imshow( cam1, [100 500]); title('Cam 1')
end

