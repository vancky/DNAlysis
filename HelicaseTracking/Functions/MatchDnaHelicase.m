function [ output ] = MatchDnaHelicase( config, helicaseImage , dnaImage )
    %  Helicase Dna Overlay - Stacks two images of Helicases and DNA
    %  Detailed explanation goes here
    

    % Split the images
    
    %helicaseSplit = CropSplitImage( config, helicaseImage );
    dnaSplit = CropSplitImage( config, dnaImage );
    
    %helicaseImageCorrect =  ( helicaseSplit.leftImage );
    helicaseImageCorrect = BackgroundFilter(helicaseImage) ;
    dnaImageCorrect = BackgroundFilter( dnaSplit.rightImage );
    output = helicaseImageCorrect;
    
    figure;
    subplot(1,2,1); imshow(helicaseImageCorrect , []); title('Helicases');
    subplot(1,2,2); imshow(dnaImageCorrect , []) ; title('DNA')
    
    
    % filter images
    
    thresholdfinder = ThresholdFinder( helicaseImageCorrect );
    
    helicaseImageFilter=helicaseImageCorrect;
    helicaseImageFilter( helicaseImageFilter < 2*thresholdfinder.threshold )=0;
    
    figure; 
    imshow(dnaImageCorrect, [],'InitialMag', 'fit')
    s=size(dnaImageCorrect);
    
    green =cat(3 , zeros(s), ones(s) , zeros(s));
    hold on
    h = imshow(green);
    hold off
    
    set(h,'AlphaData', helicaseImageFilter)

end

