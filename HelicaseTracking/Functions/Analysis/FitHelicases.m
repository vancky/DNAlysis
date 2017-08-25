function [ output ] = FitHelicases( config, spotStack, spotCenters )
    % Fit Helicases- fits helicases to an input image
    % Fits helicases to a gaussian distribution using gaussMLEv2, gives as
    % an output the centers of these spots.
    % Give as first input the config file
    % Give as second input a 3D matrix with the spots (:,:,nSpots)
    % Give as third and final input a 2D matrix with the locations of these
    % n spots [ X1, Y1; X2, Y2; ..., Xn, Yn].   
    
    fitSize = config.fitSize;
    psfSigma= config.sigma;     
    fitType = config.fitType;
    iterations = config.fitIterations;
    spotStack = single(spotStack);
    % Fit the helicases using gaussMLEv2
    
    [p , crlb, ll, t] = gaussmlev2( spotStack, psfSigma, iterations, fitType);

    % get the fitPosition from the fitted parameters
    fitPosition = p(:, 1:2);
    % Note that the fitPosition is zero indexed, thus 
    % fitPosition[ fitSize, fitSize] would be the center
    
    fitPositionXY = flip( fitPosition, 2)- fitSize;
    globalFitPosition = fitPositionXY + spotCenters;
    
    output.fitPosition = globalFitPosition;  
    output.logLikelihood = ll;
    output.sigma = p(3);
end

