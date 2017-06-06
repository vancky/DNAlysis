function [ output ] = LuckyPreProcess( config , importedHelicaseImages )
    % Lucky Pre Process - Pre processes data before the lucky algorithm
    % Detailed explanation goes here

    N = size( importedHelicaseImages , 3 );
    originalImage = 0;

    for i=1:N
        crop = CropSplitImage( config , importedHelicaseImages(:,:,i) );
        leftImage = double( crop.leftImage );
        correctionSmooth = BallSmooth( leftImage , 50) ;
        correction = max(correctionSmooth(:))./correctionSmooth;
        helicases(:,:,i)= correction.*leftImage;
        originalImage=originalImage+helicases(:,:,i);
    end
    output.originalImage = originalImage/N;
    output.correction = correction;
    
    % Stack images to better see helicases
    stackSize = config.luckyStackSize;
    numStacks = N/stackSize;
    stackHelicases = zeros ( size( helicases , 1), size( helicases , 2) , N) ;
    for i=1:numStacks
        for k=1:stackSize
            
            stackHelicases(:,:,i)=stackHelicases(:,:,i)+helicases(:,:,k+(i-1)*stackSize);
        end
        stackHelicases(:,:,i)=stackHelicases(:,:,i)/stackSize;
        stackHelicases(:,:,i)=BackgroundFilter(stackHelicases(:,:,i));
    end
    output.stackHelicases = uint16(stackHelicases);
    output.thresholdFinder= ThresholdFinder(stackHelicases(:,:,1));
    output.numStacks = numStacks;

        
end

