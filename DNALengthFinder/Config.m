function [config] = Config(config)
    
    % README!
    % ------------Naming Formalisms----------------------------------------
    % Functions are CamelCase
    % Variables, etc. are camelCased
    % Finally, structs are camelCase.camelCase
    %----------------------------------------------------------------------
    % gaussmlev2 is an external matlab script, see 
    % http://www.nature.com/nmeth/journal/v7/n5/abs/nmeth.1449.html
    % at this moment it is NOT used yet!
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
    
    config.ballRad=3;                        % Rolling ball radius for Image Filter
    config.spotFinderThreshold=3;            % Spot finder threshold
    config.AreaThreshold= 50;                % Area threshold in DNA finder   
    config.EccentricityThreshold= 0.8;       % Eccentricity threshold in DNA finder
    
    config.pixelSize=40/512 ;                 % Length per pixel, for instance 40/512 um/pix
    config.lengthUnit = 'um';                % The length unit in the pictures
    % All set? You can run the Main file now!
end