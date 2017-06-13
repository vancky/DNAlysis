function [ output ] = MatchDnaHelicase( config, dnaImage , spotFinder )
    %  Helicase Dna Overlay - Stacks two images of Helicases and DNA
    %  Detailed explanation goes here

    dnaEdgeBinary = edge( dnaImage , 'canny' );
    radius = config.binaryCloseRadius;
    se = strel('disk' , radius );
    dnaEdgeClosed= imclose(dnaEdgeBinary , se );
    
    figure;
    subplot(1,3,1); imshow( dnaImage , []) ; title('DNA')
    subplot(1,3,2); imshow( dnaEdgeBinary, []); title('Dna edges');
    subplot(1,3,3); imshow( dnaEdgeClosed, [] ); title('Connected edges')
    
    N = spotFinder.numSpots;
    circle = spotFinder.circle;
    count = 0;
    for i=1:N
        location= round(circle(i).centers); % [X,Y] center of the helicases
        check = dnaEdgeClosed (location(2), location(1)); % check whether the helicase is on the DNA (1 is yes 0 no)
        count = count +check;
    end
    match = count/N;
    
    output.match = match;
    output.count = count;
    
    figure;
    hold on
    subplot(1,2,1)
    imshow( dnaEdgeClosed);
    for i=1:N
        viscircles( circle(i).centers , circle(i).radii );
    end
    hold off
    
    hold on
    subplot(1,2,2)
    imshow( dnaImage, []); colorbar
    for i=1:N
        viscircles( circle(i).centers , circle(i).radii );
    end
    hold off
    
end

