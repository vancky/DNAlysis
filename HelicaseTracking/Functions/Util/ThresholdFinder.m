function [ output ] = ThresholdFinder( inputImage )
    % Threshold Finder - Finds the threshold in a fluorescent image
    % 1. Sort the pixels in the image
    % 2. Determine the 'bottom' and 'top' lines
    % 3. Find the intersection point of the lines
    % 4. Find the point closest to the intersection point
    
    normImage = BackgroundFilter( inputImage );
    sortedImage = sort( normImage(:) );
    l = length(sortedImage);
    maxImage=max(sortedImage);
     
    k=find( sortedImage > 0.5*maxImage );
    halfMaxIndex=k(1);
    
    % Compute the lines y1=g1*x+c1
    g1 = (sortedImage(round(0.5*l))-sortedImage(round(0.1*l)))/(0.4*l);
    g2 = 0.5*maxImage/(l-halfMaxIndex);
    c1 = sortedImage(round(0.1*l))-round(0.1*l)*g1;
    c2 = sortedImage(round(0.5*l))-halfMaxIndex*g2;
    x=1:l;
    y1 = g1*x+c1;
    y2 = g2*x+c2;
    
    % find x and y coordinates of the intersection
    intersection(1) = round((c2-c1)/(g1-g2));
    intersection(2) = y1(intersection(1));
    output.intersection=intersection;
    
    % find the closest point on the curve to the intersection
    for i=1:l
        xDiff(i)=(maxImage/l)*abs(i-intersection(1));      % Multiply by maxImage/l to 'normalize' the x and y distances
        yDiff(i)=abs(sortedImage(i)-intersection(2));
        totDiff(i)=sqrt(xDiff(i)^2+yDiff(i)^2);
    end
    
    [minDiff , minIndex] = min(totDiff);
    
    output.threshold = sortedImage(minIndex);
    output.largeThreshold = (maxImage+output.threshold)/2;
    output.filteredImage = normImage;
    output.filteredImage( normImage < output.threshold ) = 0;
      
    
%     figure;
%     hold on
%     plot( x ,sortedImage , x, y1 , x, y2 )
%     legend('Sorted Image' , 'Lower Tangent Line' , 'Upper Tangent Line')
%     plot(minIndex , output.threshold , '.' , 'MarkerSize' , 15 , 'MarkerEdgeColor', 'b', 'MarkerFaceColor' , 'b')
%     plot(intersection(1), intersection(2) , '.' , 'MarkerSize' , 15 , 'MarkerEdgeColor', 'k', 'MarkerFaceColor' , 'k')
%     ylim([0 maxImage])
%     xlabel('Pixels')
%     ylabel('Intensity Value')
%     title('Threshold Finder')
%     hold off
%     
%     
%     figure; 
%     subplot(1,2,1); imshow(normImage , [0 maxImage]);
%     title('Normalized Input Image')
%     subplot(1,2,2); imshow(output.filteredImage, [0 maxImage]);
%     title('Thresholded Image')

end

