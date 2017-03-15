function [ config ] = Config( config )
    
    %----------------------------Configuration-----------------------------
    % Set the directory where the matlab files are located
    config.matlabCd= {'H:\Git\DNAlysis\LuckyImaging'};
    % Set the directory where the images to analyze are located (one folder
    % containing subfolders with different measurements).
    config.imageCd={'K:\bn\nd\Shared\Humberto Sanchez\G0.181\161118_091516\AM16-012-YOYO_CAL01_01'};
    % Set the directory where the beamshape image is located.
    config.beamshapeCd={'K:\bn\nd\Shared\JaspervdAuweraert\Data\Feb0to1ul\AM16-012-YOYO_CAL01_shotnoise'};
 
    %----------------------------Parameters--------------------------------
    
    config.brightFinderSize= 6;    % Half size  of the patch where we are going to fit Gaussians.
                                    % For instance if the patch is 25x25 choose 12
    config.imageSize=512;           % Size of the image files (we assume a square so 512x512)
    config.initialGuess= [7 , 7, 0.1 , 1]; % initial guessing parameters to fit Gaussian
                                             % [mu_x, mu_y, sigma , scaleValue ]   
    config.cleanThreshold=8;                % threshold for the clean algorithm
    config.dataType=('uint16');
    config.stackSize=30; 
    config.luckyThreshold=400;
end

