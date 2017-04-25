function [ output ] = MatchDnaHelicase( config, splitCorrelation, helicaseImage , dnaImage , beamshape )
    %  Helicase Dna Overlay - Stacks two images of Helicases and DNA
    %  Detailed explanation goes here
    

    % Split the images
    
    helicaseSplit = SplitImage(helicaseImage ,1 );
    dnaSplit = SplitImage(dnaImage ,1 );
    
    helicaseImageCorrect = helicaseSplit.leftImage;
    dnaImageCorrect = dnaSplit.rightImage;
    output=helicaseImageCorrect;
    
    figure;
    subplot(1,2,1); imshow(helicaseImageCorrect , []); title('Helicases');
    subplot(1,2,2); imshow(dnaImageCorrect , []) ; title('DNA')
    
    % shift the image
    
    halfRow=size(helicaseImageCorrect,1);
    halfCol=size(dnaImageCorrect,2);
    rowCorrection=splitCorrelation.rowCorrection;
    colCorrection=splitCorrelation.colCorrection;
    
    helicaseImageShift=zeros(size(helicaseImageCorrect));

    for i=1:halfCol
        for j=1:halfRow
            if (j+rowCorrection > 0 && j+rowCorrection<=config.pixels) && (i+colCorrection > 0 && i+colCorrection <=config.pixels)
                helicaseImageShift( j+rowCorrection ,i+colCorrection)=helicaseImageCorrect(j,i);
            end
        end
    end
    
    figure;
    subplot(1,2,1); imshow(helicaseImageCorrect ,[]); title('Helicase Image no shift')
    subplot(1,2,2); imshow(helicaseImageShift ,[]); title('Helicase Image with shift')
    
    % filter images
    
    
    helicaseImageFilter=FilterImages(config, helicaseImageShift , 117);
    
    figure;
    subplot(1,2,1); imshow(helicaseImageShift , []); title('Helicase Image')
    subplot(1,2,2); imshow(helicaseImageFilter , []); title('Filtered Helicases')
    

    

    
    figure; 
    imshow(dnaImageCorrect, [],'InitialMag', 'fit')
    s=size(dnaImageCorrect);
    
    green =cat(3 , zeros(s), ones(s) , zeros(s));
    hold on
    h = imshow(green);
    hold off
    
    set(h,'AlphaData', helicaseImageFilter)

end

