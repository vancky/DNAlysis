function [ output ] = MatchHelicases( config, spotsCam0, spotsCam1, cam0Size )
    % Match Helicases - checks colocalization of cam 0 and cam 1 helicases
    %   Detailed explanation goes here
     
    numSpots0 = size( spotsCam0, 1);
    numSpots1 = size( spotsCam1, 1);
    % for simulating random helicases next to the actual measurements

    numRandom = 50;
    spotsRandom = zeros( numRandom, numSpots1, 2);
    for k = 1:numRandom
        for i = 1:numSpots1
            spotsRandom(k,i,:)= [ unifrnd(1, cam0Size(2)), unifrnd(1, cam0Size(1))];
        end
    end
    
    match = zeros( numSpots0, 1);
    matchRandom = zeros( numSpots0, 1);
    
    % perform the analysis for the regular spots
    for i = 1:numSpots0
        center0 = spotsCam0(i,1:2);
        check = 0;
        
        for j = 1:numSpots1
            center1 = spotsCam1(j,1:2);
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
            match(i) =0;
        else
            fprintf('Error in checking for match with measured helicases.\n')
        end
        
        %Also do this for random spots
        for k = 1:numRandom
            checkRandom =0;
            for j = 1:numSpots1
                centerRandom = spotsRandom(k,j,1:2);
                dxRandom= abs( center0(2)-centerRandom(2) );
                dyRandom= abs( center0(1)-centerRandom(1) );
                distRandom = sqrt( dxRandom^2 + dyRandom^2 );

                if distRandom <= config.colocalizationMatch
                    checkRandom = checkRandom +1;
                else
                   checkRandom = checkRandom;
                end
            end
        
            if checkRandom > 0
                matchRandom(k,i) = 1;
            elseif checkRandom == 0
                matchRandom(k,i) = 0;
            else
                fprintf('Error in checking for match with random helicases.\n')
            end
        end
    end    
    
    locations = match.*spotsCam0;
    matchLocations(:,1) = nonzeros( locations(:,1));
    matchLocations(:,2) = nonzeros( locations(:,2));
    
    
    matchFraction = sum(match) / numSpots0;
    output.match = match;
    output.matchFraction = matchFraction;
    output.matchLocations = matchLocations;
    
    matchFractionRandom = sum(sum(matchRandom)) / (numSpots0*numRandom);
    output.matchRandom = matchRandom;
    output.matchFractionRandom = matchFractionRandom;
end