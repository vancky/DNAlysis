function [config] = Config()
    
    % README!
    % ------------Naming Formalisms----------------------------------------
    % Functions are CamelCase
    % Variables, etc. are camelCased
    % Finally, structs are camelCase.camelCase
    %----------------------------------------------------------------------
    % gaussmlev2 is an external matlab script, see 
    % http://www.nature.com/nmeth/journal/v7/n5/abs/nmeth.1449.html
    %----------------------------------------------------------------------
    
    %----------------------------Configuration-----------------------------
    
    % Set the directory where the matlab files are located
    config.matlabCd= {'H:\Git\DNAlysis\DNALengthFinder'};
    % Set the directory where the images to analyze are located (one folder
    % containing subfolders with different measurements).
    config.imageCd={'K:\bn\nd\Shared\JaspervdAuweraert\Data\Feb0to1ul'};
    % Set the directory where the beamshape image is located.
    config.beamshapeCd={'K:\bn\nd\Shared\JaspervdAuweraert\Data\Feb0to1ul\AM16-012-YOYO_CAL01_shotnoise'};
    %----------------------------Parameters--------------------------------
    
    config.ballRad=3;                       % Rolling ball radius
    config.spotFinderTreshold=3;            % Spot finder treshold
    
    % All set? You can run the Main file now!
end