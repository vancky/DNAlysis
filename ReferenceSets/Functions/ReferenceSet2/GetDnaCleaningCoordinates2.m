function [ output ] = GetDnaCleaningCoordinates2( index )
    % DNA Cleaning Coordinates 2 - creates the dna cleaning coordinates 
    % for reference set 2.
  
    % Define cleanregions [ XTL, YTL, XBR, YBR]
    % Where TL is top left and BR is bottom right    
    
    switch index
        case 1
        % Image 2.1
        cr(1,:)= [ 13, 274, 70, 279]; % part 1 of dna
        cr(2,:)= [ 39, 35, 88, 41];
        cr(3,:)= [ 106, 291, 167, 305];
        cr(4,:)= [ 27, 87, 106, 92];
        cr(5,:)= [ 134, 378, 200, 391];
        
        case 2
        % Image 2.2
        cr(1,:)= [ 53, 119, 115, 129];
        cr(2,:)= [ 193, 98, 226, 111];
        cr(3,:)= [ 52, 198, 95, 208];
        cr(4,:)= [ 153, 395, 204, 408];
        cr(5,:)= [ 23, 331, 71, 340];
        
        case 3
        % Image 2.3
        cr(1,:)= [ 80, 359, 144, 369];
        cr(2,:)= [ 102, 319, 148, 330];
        cr(3,:)= [ 83, 418, 152, 427];
        cr(4,:)= [ 29, 404, 83, 417];
        cr(5,:)= [ 40, 302, 114, 314];
        
        otherwise
            fprintf('There are no cleaning regions defined for this index.\n')
    end
    
    output = cr;

end

