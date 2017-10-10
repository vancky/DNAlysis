function [ output ] = SplitImage( inputImage, direction )
    % Split Image - Splits an image
    % Give as inputs the image and the direction of the split.
    % The functino returns output.leftImage and output.rightImage for
    % horizontal direction and output.topImage, output.bottom Image for
    % vertical direction.
    % For instance, splitImage=SplitImage( myImage , 'vertical') splits the
    % image myImage into splitImage.leftImage and splitImage.rightImage

    
    % Number of rows and columns in the input image
    numRows = size(inputImage,1);
    numColumns = size(inputImage,2);
    
    switch direction
        case 'vertical'    
            halfRow=numRows;
            halfCol=numColumns/2;
            output.leftImage=inputImage( : , 1:halfCol );
            output.rightImage=inputImage( : , halfCol+1:2*halfCol );
        case 'horizontal'
            halfRow=numRows/2;
            halfCol=numColumns;
            output.topImage=inputImage( 1:halfRow, : );
            output.bottomImage=inputImage( halfRow+1:2*halfRow , : );
        otherwise
            fprintf(['Please specify a correct direction to crop the' ... 
                        'image, either horizontal or vertical.\n']);
    end
end

