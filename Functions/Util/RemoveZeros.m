function [ output ] = RemoveZeros( inputMatrix, zeroDirection )
    % Remove Zeros - Removes zero from a matrix.
    % Takes as input a matrix  with rows or columns that are
    % zero. Note this function does not work when there are both rows and 
    % columnns which are zero .
    % Give as inputs the matrix and the direction of the zeros, 'column' 
    % or 'row'. So for instance RemoveZeros( inputMatrix, 'row')
    
    switch zeroDirection
        case 'column'
            inputMatrix = inputMatrix';
        case 'row'
            inputMatrix = inputMatrix;
        otherwise
            fprintf(['Please specify the direction of the zeros, as the' ...
                'second input argument. Either row or column.\n'])
    end
        
    matrixSize = size( inputMatrix);
    averageMatrix = mean( inputMatrix, 2);
    numZeros = sum( averageMatrix ==0);
    
    outputMatrix = inputMatrix;
    outputMatrix( inputMatrix==0) = [];
       
    outputMatrix = reshape( outputMatrix, matrixSize(1)-numZeros, matrixSize(2));
    
    switch zeroDirection
        case 'column'
            outputMatrix= outputMatrix';
        case 'row'
            outputMatrix = outputMatrix;
        otherwise
            fprintf(['Please specify the direction of the zeros, as the' ...
                'second input argument. Either row or column.\n'])
    end
    
    output = outputMatrix;

end

