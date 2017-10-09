function [ output ] = EdgeFilter( inputImage  )
    % Edge Filter - Detects the edges in an image
    
    
    [BW1, threshold] = edge( inputImage , 'canny' );
    
    figure; 
    imshow(BW1)
    title('Canny Filter');
    
    output = BW1;
end

