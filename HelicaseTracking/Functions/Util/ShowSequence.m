function [ ] = ShowSequence( inputSequence , pauseTime )
    % Show Sequence - Shows an image sequence with short pauses
    
    figure;
    
    numFrames = size( inputSequence , 3 );
    
    for i=1:numFrames
        imshow( inputSequence(:,:,i) , [] );
        pause( pauseTime )
    end
end

