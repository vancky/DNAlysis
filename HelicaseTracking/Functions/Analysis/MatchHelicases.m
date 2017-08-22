function [ output ] = MatchHelicases( config, spotFinder )
    % Match Helicases - checks colocalization of cam 0 and cam 1 helicases
    %   Detailed explanation goes here
    
    circle0 = spotFinder.cam0.circle;
    circle1 = spotFinder.cam1.circle;
    
    
    
    numSpots0 = spotFinder.cam0.numSpots;
    numSpots1 = spotFinder.cam1.numSpots;
    
%     for simulating randomness  
%     for i = 1:numSpots1
%         circle1(i).centers= [ unifrnd(1,256), unifrnd(1,512)];
%     end
    
    match = zeros(numSpots0,1);
    
    for i = 1:numSpots0
        center0 = circle0(i).centers;
        check =0;
        
        for j = 1:numSpots1
            center1 = circle1(j).centers;
            dx= abs( center0(2)-center1(2) );
            dy= abs( center0(1)-center1(1) );
            dist = sqrt(dx^2+dy^2);
            
            if dist <= config.colocalizationMatch
                check = check + 1;
            else
                check = check;
            end
        end
         
        if check > 0
            match(i) = 1;
        elseif check == 0
            match(i) = 0;
        else
            fprintf('Error in checking for match')
        end
        
    end    
    
    matchFraction = sum(match) / numSpots0;
    output.match = match;
    output.matchFraction = matchFraction;
end

