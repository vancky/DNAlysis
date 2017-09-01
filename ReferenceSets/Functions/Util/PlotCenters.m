function [ output ] = PlotCenters( centers, markerSize )
    % Plot Centers - plots a list of x, y coordinates, as red dots
    % the centers have to be formatted as a n*2 matrix where the first
    % column are the x positions and the second column the corresponding y
    % positions. Also specify the markerSize. Thus, the formalism is
    % PlotCenters( centers, markerSize) for instance:
    % PlotCenters( [1,1; 2,2; 3,3], 10)
    hold on
    numCenters = size( centers, 1);
    for i = 1 : numCenters
        x = centers(i,1);
        y = centers(i,2);
        plot( x, y, '.r', 'MarkerSize', markerSize);
    end
    hold off
end

