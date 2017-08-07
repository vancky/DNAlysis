function [ output ] = CreateHelicaseImage3( config )
    % Create Helicase Image 3 
    % Creates the static helicase image

    % Specify the locations of the helicases to be simulated [x,y]
    locations(1,:) = [ 10, 10];
    locations(2,:) = [ 30, 30];
%     locations(3,:) = [ , ];
%     locations(4,:) = [ , ];
%     locations(5,:) = [ , ];
%     locations(6,:) = [ , ];
%     locations(7,:) = [ , ];
%     locations(8,:) = [ , ];
%     locations(9,:) = [ , ];
%     locations(10,:) = [ , ];
%     locations(11,:) = [ , ];
%     locations(12,:) = [ , ];
%     locations(13,:) = [ , ];
%     locations(14,:) = [ , ];
%     locations(15,:) = [ , ];
%     locations(16,:) = [ , ];
%     locations(17,:) = [ , ];
%     locations(18,:) = [ , ];
%     locations(19,:) = [ , ];
%     locations(20,:) = [ , ];
%     locations(21,:) = [ , ];
%     locations(22,:) = [ , ];
%     locations(23,:) = [ , ];
%     locations(24,:) = [ , ];
%     locations(25,:) = [ , ]; 
    
    % Simulate the helicases 
    helicaseImage = zeros( config.imageSize);
    numHelicases = size( locations, 1);
    parameters(3) = config.sigma;
    parameters(4) = config.scaleValue;
    parameters(5) = config.imageSize(2); % x
    parameters(6) = config.imageSize(1); % y
        
    for i = 1 : numHelicases
        parameters(1) = locations(i,1);
        parameters(2) = locations(i,2);
        helicaseImage = helicaseImage+ SimulateHelicase( parameters );
    end
    
    output = helicaseImage;
end

