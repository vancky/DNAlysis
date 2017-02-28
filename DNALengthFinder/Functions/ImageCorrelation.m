function [ imageCorrelation ] = ImageCorrelation( dnaFinderBoxes ,N )
    %Correlates the DNA strands between images.
    
    for k=1:(N-1)                           %loop to evaluate the distance between the rectangles
        L1=length(dnaFinderBoxes{k});       %number of DNA strands in the k-th measurement
        L2=length(dnaFinderBoxes{k+1});     %number of DNA strands in the k+1-th measurement
        for j=1:L1
            for i=1:L2
                imageCorrelation.diffx{k,1}(j,i)=dnaFinderBoxes{k}(j).BoundingBox(1)-dnaFinderBoxes{k+1}(i).BoundingBox(1);  %Compare x-position of box j in measurement k with all boxes i in measurement k+1
                imageCorrelation.diffy{k,1}(j,i)=dnaFinderBoxes{k}(j).BoundingBox(2)-dnaFinderBoxes{k+1}(i).BoundingBox(2);  %Compare y-position of box j in measurement k with all boxes i in measurement k+1
                imageCorrelation.distance{k,1}=sqrt(imageCorrelation.diffx{k,1}.^2+imageCorrelation.diffy{k,1}.^2);
            end
        end
    end
    
    
    
end

