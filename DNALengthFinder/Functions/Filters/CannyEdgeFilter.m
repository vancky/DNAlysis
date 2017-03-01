function [ BW ] = CannyEdgeFilter( data, treshold, sigma)
    %Canny Edge Filer 
    %Detailed explanation goes here
    BW=edge(data,'Canny',treshold, sigma);
    figure
    subplot(1,2,1); imshow(data,[]); title('input image')
    subplot(1,2,2); imshow(BW,[]); title('Canny filter')  
end

