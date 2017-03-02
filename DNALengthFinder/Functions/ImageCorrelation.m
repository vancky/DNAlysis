function [ imageCorrelation ] = ImageCorrelation( dnaFinderBoxes ,N, outputVelocity )
    %Correlates the DNA strands between images.
    maxDna=max(cellfun('size', dnaFinderBoxes, 1));     %image with largest number of DNA strands detected
    for k=1:(N-1)                           %loop to evaluate the distance between the rectangles
        clear matchDna minimum
        L1=length(dnaFinderBoxes{k});       %number of DNA strands in the k-th measurement
        L2=length(dnaFinderBoxes{k+1});     %number of DNA strands in the k+1-th measurement
        for j=1:L1
            for i=1:L2
                imageCorrelation.diffx{k,1}(j,i)=dnaFinderBoxes{k}(j).BoundingBox(1)-dnaFinderBoxes{k+1}(i).BoundingBox(1);  %Compare x-position of box j in measurement k with all boxes i in measurement k+1
                imageCorrelation.diffy{k,1}(j,i)=dnaFinderBoxes{k}(j).BoundingBox(2)-dnaFinderBoxes{k+1}(i).BoundingBox(2);  %Compare y-position of box j in measurement k with all boxes i in measurement k+1
                imageCorrelation.distance{k,1}=sqrt(imageCorrelation.diffx{k,1}.^2+imageCorrelation.diffy{k,1}.^2);
            end
        end
        [minimum,imageCorrelation.index{k,1}]=min(imageCorrelation.distance{k,1},[],2);
        imageCorrelation.matchDna{k,1}=minimum<5;                             %if the distance is smaller than 3, the DNA segments match
        imageCorrelation.indexCorrect{k,1}=imageCorrelation.index{k,1}.*(imageCorrelation.matchDna{k,1});                    %Find the indexes of the correct DNA.
        
    end
    L3=12;
    for l=2:N                 % build matrix with index numbers for all the strands at the first image
           for p=1:L3
              imageCorrelation.indexMatrix(:,1)=1:L3;
              if imageCorrelation.indexMatrix(p,l-1)==0               % if we encounter a mismatch, the remaining index values are set to zero
                imageCorrelation.indexMatrix(p,l)=0;  
              else
                imageCorrelation.indexMatrix(p,l)=imageCorrelation.indexCorrect{l-1,1}(imageCorrelation.indexMatrix(p,l-1));
              end
           end           
    end
    

    for h=1:N-1
        for k=1:L3           
            imageCorrelation.length(k,1)=dnaFinderBoxes{1,1}(k).BoundingBox(3);    
            if imageCorrelation.indexMatrix(k,h+1) == 0
                imageCorrelation.length(k,h+1)=0;
            else
                imageCorrelation.length(k,h+1)=dnaFinderBoxes{h+1,1}(imageCorrelation.indexMatrix(k,h+1)).BoundingBox(3);
            end
        end
        
    end
    
    imageCorrelation.length=(50/512)*imageCorrelation.length;     % the length of the DNA strands (note conversion from pix to um)
    
    figure
    ylabel('Dna length (um)')  
    xlabel('Flow velocity (ul/min)')
    hold on
    for g=1:L3
        plot(outputVelocity,imageCorrelation.length(g,:))
      
    end
    hold off
end

