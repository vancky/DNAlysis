function [ output ] = SimulateDna( parameters )
    % Simulate Dna - Simulates images with DNA strands
    % Detailed explanation goes here
    
    dnaSizeX = parameters(1);
    dnaSizeY= parameters(2);
    dnaIntensity = parameters(3);
    blurSize = parameters(4);
    domainSizeX = parameters(5);
    domainSizeY = parameters(6);
    % Top leftIndexes of the dna
    dnaTlX = parameters(7);
    dnaTlY = parameters(8);
    
    dna = zeros( domainSizeY, domainSizeX);
    dna(dnaTlY: dnaTlY+dnaSizeY-1, dnaTlX: dnaTlX+dnaSizeX-1) = dnaIntensity;
    
    dna = imgaussfilt( dna, blurSize);
    
    output = dna;
end

