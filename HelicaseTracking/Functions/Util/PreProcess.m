function [ output ] = PreProcess( config , importedImages )
    % Pre Process - Pre processes data before the lucky algorithm
    % Detailed explanation goes here

    N = size( importedImages , 3 );
    originalImage = 0;

    for i=1:N
        crop = CropSplitImage( config , importedImages(:,:,i) );
        leftImage = double( crop.leftImage );
        correctionSmooth = BallSmooth( leftImage , 50) ;
        correction = max(correctionSmooth(:))./correctionSmooth;
        helicases(:,:,i)= correction.*leftImage;
        originalImage=originalImage+helicases(:,:,i);
    end
    output.originalImage = originalImage/N;
    output.correction = correction;
    output.helicases = helicases;
end

