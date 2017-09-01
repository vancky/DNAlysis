function [ output ] = GetDnaCleaningCoordinates2( index )
    % DNA Cleaning Coordinates 2 - creates the dna cleaning coordinates 
    % for reference set 2.
  
    % Define cleanregions [ XTL, YTL, XBR, YBR]
    % Where TL is top left and BR is bottom right    
    
    switch index
        case 1
        % Image 2.1
        cr(1,:)= [ 11, 271, 85, 284];
        cr(2,:)= [ 35, 32, 94, 45];
        cr(3,:)= [ 106, 291, 167, 305];
        cr(4,:)= [ ];
        cr(5,:)= [ ];
        
        case 2
        % Image 2.2
        cr(1,:)= [ ];
        cr(2,:)= [ ];
        cr(3,:)= [ ];
        cr(4,:)= [ ];
        cr(5,:)= [ ];
        
        case 3
        % Image 2.3
        cr(1,:)= [ ];
        cr(2,:)= [ ];
        cr(3,:)= [ ];
        cr(4,:)= [ ];
        cr(5,:)= [ ];
        
        case 4
        % Image 2.4
        cr(1,:)= [ ];
        cr(2,:)= [ ];
        cr(3,:)= [ ];
        cr(4,:)= [ ];
        cr(5,:)= [ ];
        
        case 5
        % Image 2.5
        cr(1,:)= [ ];
        cr(2,:)= [ ];
        cr(3,:)= [ ];
        cr(4,:)= [ ];
        cr(5,:)= [ ];
        
        otherwise
            fprintf('There are no cleaning regions defined for this index.\n')
    end
    output = cr;

end

