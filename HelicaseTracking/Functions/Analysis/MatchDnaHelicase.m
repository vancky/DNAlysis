function [ output ] = MatchDnaHelicase( config, dnaImage , spotFinder )
    %  Helicase Dna Overlay - Stacks two images of Helicases and DNA
    %  Detailed explanation goes here
    
    % Finds the DNA roi from a dna image.
    dnaFinder = DnaFinder( config, dnaImage);
    
    % Perform the actual matching of DNA with Helicases
    
    N = spotFinder.numSpots;
    circle = spotFinder.circle;
    count = 0;
    for i=1:N
        location= round(circle(i).centers); % [X,Y] center of the helicases
        check = dnaFinder.dnaRoi(location(2), location(1)); % check whether the helicase is on the DNA (1 is yes 0 no)
        count = count +check;
    end
    match = count/N;
    
    output.match = match;
    output.count = count;
    
    figure;
    hold on
    subplot(1,2,1)
    imshow( dnaEdgeClosed );
    for i=1:N
        viscircles( circle(i).centers , circle(i).radii );
    end
    hold off
    title('Binary Dna map with located helicases')

    
    hold on
    subplot(1,2,2)
    imshow( dnaImage, []); colorbar
    for i=1:N
        viscircles( circle(i).centers , circle(i).radii );
    end
    hold off
    title('Dna Image with located helicases')
   
end

