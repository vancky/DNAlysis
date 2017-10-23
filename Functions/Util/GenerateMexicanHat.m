function [ output ] = GenerateMexicanHat( sigma )
    % Generate Mexican Hat - Generates a centered mexican hat function
    % The only input required is sigma, the mexican hat will be normalized
    % and have a size large enough to capture the function ~(10*sigma)
    
    halfSize =  round(5*sigma);
    domainSize = 1+2*halfSize; 
    mu = halfSize;
   
    x = 1:domainSize;
    y = 1:domainSize;
    [X,Y] = meshgrid(x,y);
    X = X-mu-1;
    Y = Y-mu-1;
    
    output = (1/(pi*sigma^2))*exp(-(X.^2+Y.^2)/(2*sigma^2)).*(1-0.5*((X.^2+Y.^2)/(2*sigma^2)));

end

