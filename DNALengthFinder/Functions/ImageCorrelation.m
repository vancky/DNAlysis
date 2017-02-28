function [ output_args ] = ImageCorrelation( dnaFinderBoxes ,N )
    

    
    for k=1:(N-1)
        dnaFinderBoxes{k,1}()=dnaFinderBoxes{k+1,1};
    end

end

