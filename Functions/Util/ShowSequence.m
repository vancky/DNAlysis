function [ ] = ShowSequence( inputSequence , greyScale, pauseTime )
    % Show Sequence - Shows an image sequence with short pauses
    % Give as input the image sequence, greyscale and the pauseTime in 
    % seconds between each image
    % For instance ShowSequence( imageSequence, [ 100, 150], 0.1)
    
%     figure( 'units', 'normalized', 'outerposition', [ 0 0 1 1]);
    
    figure
    
    numFrames = size( inputSequence, 3);
    
    imshow( inputSequence(:,:,1) , greyScale );
    set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
    pause( pauseTime )
    hold on
    for i = 2:numFrames
        imshow( inputSequence(:,:,i) , greyScale );
        pause( pauseTime )
    end
end

