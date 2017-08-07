function [ output ] = CreateDnaImage3( config )
    % Create Dna Image 3 - Summary of this function goes here
    % Detailed explanation goes here

    % Specify the locations of the dna to be simulated top left [x,y]
    
    locations(1,:) = [ 20, 20];
    locations(2,:) = [ 60, 100];
    locations(3,:) = [ 100, 180];
    locations(4,:) = [ 140, 260];
    locations(5,:) = [ 180, 340];
    
    numDna = size(locations, 1);
    dnaImage = zeros( config.imageSize);
    parameters(1) = config.dnaSize(1);
    parameters(2) = config.dnaSize(2);
    parameters(3) = config.dnaIntensity;
    parameters(4) = config.blurSize;
    parameters(5) = config.imageSize(2); % x
    parameters(6) = config.imageSize(1); % y
    
    for i = 1: numDna        
        parameters(7)= locations( i, 1);
        parameters(8)= locations( i, 2);
        dnaImage= SimulateDna( parameters)+ dnaImage;
    end
    
    output = dnaImage;
end

