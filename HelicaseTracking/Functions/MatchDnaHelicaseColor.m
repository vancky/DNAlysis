function [ output ] = MatchDnaHelicase( config, helicaseImage , dnaImage )
    %  Helicase Dna Overlay - Stacks two images of Helicases and DNA
    %  Detailed explanation goes here
    
    figure;
    subplot(1,2,1); imshow(helicaseImage , []); title('Helicases');
    subplot(1,2,2); imshow(dnaImage , []) ; title('DNA')
    
    % filter images
    
    thresholdfinder = ThresholdFinder( helicaseImage );
    
    helicaseImageFilter=helicaseImage;
    helicaseImageFilter( helicaseImageFilter < 2*thresholdfinder.threshold )=0;
    
    figure; 
    imshow(dnaImage, [],'InitialMag', 'fit')
    s=size(dnaImage);
    
    green =cat(3 , zeros(s), ones(s) , zeros(s));
    hold on
    h = imshow(green);
    hold off
    
    set(h,'AlphaData', helicaseImageFilter)

end

