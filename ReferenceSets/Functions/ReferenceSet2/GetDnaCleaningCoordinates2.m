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
        cr(5,:)= [ 134, 376, 200, 391];
        
        case 2
        % Image 2.2
        cr(1,:)= [ 34, 208, 91, 222];
        cr(2,:)= [ 98, 260, 168, 271];
        cr(3,:)= [ 137, 294, 212, 309];
        cr(4,:)= [ 1, 72, 80, 87];
        cr(5,:)= [ 98, 63, 183, 75];
        
        case 3
        % Image 2.3
        cr(1,:)= [ 53, 119, 115, 129];
        cr(2,:)= [ 193, 98, 226, 111];
        cr(3,:)= [ 52, 198, 95, 207];
        cr(4,:)= [ 153, 395, 204, 408];
        cr(5,:)= [ 23, 331, 71, 340];
        
        case 4
        % Image 2.4
        cr(1,:)= [ 26, 84, 107, 93];
        cr(2,:)= [ 37, 34, 91, 44];
        cr(3,:)= [ 13, 269, 86, 283];
        cr(4,:)= [ 108, 293, 163, 303];
        cr(5,:)= [ 102, 170, 160, 180];
        
        case 5
        % Image 2.5
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

