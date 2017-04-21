function [ output ] = Lucky( config , clean )
    % Lucky - Filters top 20% gaussians
    %   Detailed explanation goes here
    
    brightFinder = clean.brightFinder;       % brightFinder is a cell array
    fitHelicases = clean.fitHelicases;       % fitHelicases also is a cell array
    
    % find the gaussians with 20% lowest CRLB
    lengthCrlb = size( clean.crlb , 1);
    xyCrlb = sqrt(clean.crlb(:,1).^2+clean.crlb(:,2).^2);
    sortedCrlb = sort(xyCrlb);
    threshold = sortedCrlb( round(lengthCrlb*config.luckyThreshold) );
    luckyIndexes =  find( xyCrlb < threshold );
    numLuckyGaussians = length(luckyIndexes);
    
    
    % Build the lucky Image
    output.luckyImage = 0;
    for i = 1:numLuckyGaussians
        index = luckyIndexes(i);
        generateGaussian = GenerateGaussianMask( config, brightFinder{index} , fitHelicases{index} ) ;
        output.luckyImage = output.luckyImage+uint32(generateGaussian.mask);
    end
        
end

