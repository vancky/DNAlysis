function [ output ] = CreateHelicaseImage1( config )
    % Create Helicase Image 1
    % Creates the static helicase image

    % Specify the locations of the helicases to be simulated [x,y]
    locations(1,:) = [ 32, 20];
    locations(2,:) = [ 56, 20];
    locations(3,:) = [ 63, 100];
    locations(4,:) = [ 97, 100];
    locations(5,:) = [ 126, 180];
    locations(6,:) = [ 154, 180];
    locations(7,:) = [ 146, 260];
    locations(8,:) = [ 189, 260];
    locations(9,:) = [ 203, 340];
    locations(10,:) = [ 214, 340];
    locations(11,:) = [ 50, 50];
    locations(12,:) = [ 20, 70];
    locations(13,:) = [ 164, 100];
    locations(14,:) = [ 62, 130];
    locations(15,:) = [ 228, 150];
    locations(16,:) = [ 52, 160];
    locations(17,:) = [ 143, 160];
    locations(18,:) = [ 255, 190];
    locations(19,:) = [ 128, 190];
    locations(20,:) = [ 24, 220];
    locations(21,:) = [ 133, 270];
    locations(22,:) = [ 75, 320];
    locations(23,:) = [ 100, 360];
    locations(24,:) = [ 148, 410];
    locations(25,:) = [ 162, 450]; 
    
    % Simulate the helicases 
    helicaseImage = zeros( config.imageSize);
    numHelicases = size( locations, 1);
    parameters(3) = config.sigma;
    parameters(4) = config.scaleValue1;
    parameters(5) = config.imageSize(2); % x
    parameters(6) = config.imageSize(1); % y
        
    for i = 1 : numHelicases
        parameters(1) = locations(i,1);
        parameters(2) = locations(i,2);
        helicaseImage = helicaseImage+ SimulateHelicase( parameters );
    end
    
    integerImage = uint16(helicaseImage);
    doubleImage = double(integerImage);
    
    output = doubleImage;
    
end

