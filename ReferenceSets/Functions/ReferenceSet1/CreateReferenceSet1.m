function [ output ] = CreateReferenceSet1( config )
    % Create Reference Set 1
    % Imports the relevant bead image for reference set 1

    fprintf('Importing images for reference set 1.\n')
    beadImage = ImportOneCamera( config.referenceSet1Cd , 'stack' );
    fprintf('Images for reference set 1 have been imported.\n')
    
    figure;
    imshow( beadImage{1} , [100 150])
    output = beadImage{1};
end

