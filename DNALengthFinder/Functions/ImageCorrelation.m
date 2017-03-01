function [ imageCorrelation ] = ImageCorrelation( dnaFinderBoxes ,N )
    %Correlates the DNA strands between images.
    maxDna=max(cellfun('size', dnaFinderBoxes, 1));     %image with largest number of DNA strands detected
    imageCorrelation.indexCorrect=zeros(maxDna,N);
    for k=1:(N-1)                           %loop to evaluate the distance between the rectangles
        clear matchDna indexCorrect index minimum
        L1=length(dnaFinderBoxes{k});       %number of DNA strands in the k-th measurement
        L2=length(dnaFinderBoxes{k+1});     %number of DNA strands in the k+1-th measurement
        for j=1:L1
            for i=1:L2
                imageCorrelation.diffx{k,1}(j,i)=dnaFinderBoxes{k}(j).BoundingBox(1)-dnaFinderBoxes{k+1}(i).BoundingBox(1);  %Compare x-position of box j in measurement k with all boxes i in measurement k+1
                imageCorrelation.diffy{k,1}(j,i)=dnaFinderBoxes{k}(j).BoundingBox(2)-dnaFinderBoxes{k+1}(i).BoundingBox(2);  %Compare y-position of box j in measurement k with all boxes i in measurement k+1
                imageCorrelation.distance{k,1}=sqrt(imageCorrelation.diffx{k,1}.^2+imageCorrelation.diffy{k,1}.^2);
            end
        end
        [minimum,index]=min(imageCorrelation.distance{k,1},[],2);
        matchDna=minimum<3;                             %if the distance is smaller than 3, the DNA segments match
        imageCorrelation.indexCorrect(k)=index(matchDna);                    %Find the indexes of the correct DNA.
        
    end
    
    
    
end

