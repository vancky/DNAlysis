function [ output ] = GenerateCropCoordinates( inputImage , splitCorrelation )
    % GenerateCropCoordinates - finds the coordinates for the black lines
    % in an image from camera 0.
    % Takes as input an (the beamshape in this case) image from camera 0 
    % and finds the coordinates of the black lines.
    
    splitImage=SplitImage(inputImage , 1);
    
    numCol=size( splitImage.leftImage , 2);
    rowAvgLeft=mean(splitImage.leftImage,1);   % Averaged over all rows
    rowAvgRight=mean(splitImage.rightImage,1);  % Averaged over all row
    diffLeft=zeros(1 , numCol-1); 
    diffRight=zeros(1 , numCol-1);
    
    for i=1:numCol-1
       diffLeft(i) = rowAvgLeft(:,i+1)-rowAvgLeft(:,i);
       diffRight(i)= rowAvgRight(:,i+1)-rowAvgRight(:,i);
    end
    
    [ value , indexLeftMax]   = max(diffLeft);
    [ value , indexLeftMin]   = min(diffLeft);
    [ value , indexRightMax]  = max(diffRight);
    [ value , indexRightMin]  = min(diffRight);
    
    output.left =  [ indexLeftMax , indexLeftMin];
    output.right = [ indexRightMax , indexRightMin];
end

