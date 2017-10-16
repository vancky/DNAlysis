function [ ] = ShowSequence( inputSequence , greyScale, pauseTime )
    % Show Sequence - Shows an image sequence with short pauses
    % Give as input the image sequence, greyscale and the pauseTime in 
    % seconds between each image
    % For instance ShowSequence( imageSequence, [ 100, 150], 0.1)
    
    figure;
    
    numFrames = size( inputSequence , 3 );
    
    for i=1:numFrames
        imshow( inputSequence(:,:,i) , greyScale );
        pause( pauseTime )
    end
end

