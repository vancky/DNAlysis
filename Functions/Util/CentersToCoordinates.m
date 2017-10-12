function [ output ] = CentersToCoordinates( centers, halfSquareSize )
    % Centers To Coordinates - Transform the center coordinates of a matrix
    % to a more 
    % Give as inpuits the center locations, a N by 2 matrix (x,y as the
    % columns the different positions are rows). And half of the size of
    % the square matrix that you want. The total size will be
    % 2*halfSquareSize+1
    
    % make sure that we have integer values
    centers = round( centers);
    
    xMin = centers(:,1)-halfSquareSize;
    xMax = centers(:,1)+halfSquareSize;
    yMin = centers(:,2)-halfSquareSize;
    yMax = centers(:,2)+halfSquareSize;

    output = [xMin, xMax, yMin, yMax];
end

