function [ output ] = MatchHelicases( config, spotFinder )
    % Match Helicases - checks colocalization of cam 0 and cam 1 helicases
    %   Detailed explanation goes here
    
    circle0 = spotFinder.cam0.circle;
    circle1 = spotFinder.cam1.circle;    
    numSpots0 = spotFinder.cam0.numSpots;
    numSpots1 = spotFinder.cam1.numSpots;
    
    % for simulating random helicases next to the actual measurements
    for i = 1:numSpots1
        circle1Random(i).centers= [ unifrnd(1,256), unifrnd(1,512)];
    end
    
    match = zeros(numSpots0, 1);
    matchRandom = zeros(numSpots0, 1);
    
    for i = 1:numSpots0
        center0 = circle0(i).centers;
        check =0;
        checkRandom =0;
        
        for j = 1:numSpots1
            center1 = circle1(j).centers;
            dx= abs( center0(2)-center1(2) );
            dy= abs( center0(1)-center1(1) );
            dist = sqrt(dx^2+dy^2);
            
            center1Random = circle1Random(j).centers;
            dxRandom= abs( center0(2)-center1Random(2) );
            dyRandom= abs( center0(1)-center1Random(1) );
            distRandom = sqrt(dxRandom^2+dyRandom^2);
            
            if dist <= config.colocalizationMatch
                check = check + 1;
            else
                check = check;
            end
            
            if distRandom <= config.colocalizationMatch
                checkRandom = checkRandom +1;
            else
               checkRandom = checkRandom;
            end
        end
         
        if check > 0
            match(i) = 1;
        elseif check == 0
            match(i) =0;
        else
            fprintf('Error in checking for match with measured helicases.\n')
        end
        
        if checkRandom > 0
            matchRandom(i) = 1;
        elseif checkRandom == 0
            matchRandom(i) = 0;
        else
            fprintf('Error in checking for match with random helicases.\n')
        end
        
    end    
    
    matchFraction = sum(match) / numSpots0;
    output.match = match;
    output.matchFraction = matchFraction;
    
    matchFractionRandom = sum(matchRandom) / numSpots0;
    output.matchRandom = matchRandom;
    output.matchFractionRandom = matchFractionRandom;
end

