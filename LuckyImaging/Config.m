function [ config ] = Config( config )
    
    %----------------------------Configuration-----------------------------
    % Set the directory where the matlab files are located
    config.matlabCd= {'D:\jvanderauweraert\Git\DNAlysis\LuckyImaging'};
    % Set the directory where the images to analyze are located (one folder
    % containing subfolders with different measurements).
    config.imageCd={'K:\bn\nd\Shared\Humberto Sanchez\G0.181\170316_132720\DNA(TL16-071)yoyo488-pos2A'};
 
    %----------------------------Parameters--------------------------------
    
    config.brightFinderSize= 6;     % Half size  of the patch where we are going to fit Gaussians.
                                    % For instance if the patch is 25x25 choose 12
    config.imageSize=512;           % Size of the image files (we assume a square so 512x512)
    % initial guessing parameters to fit Gaussian  [mu_x, mu_y, sigma , scaleValue ]   
    config.initialGuess= [config.brightFinderSize , config.brightFinderSize , 0.1 , 1]; 
    
    config.cleanThreshold=13;                % Threshold for the clean algorithm
    config.dataType=('uint16');              % Data type of the images being analysed
    config.stackSize=10;                     % How many images do you want to stack before applying the CLEAN algorithm?
    config.luckyThreshold=0.2;               % Select the fraction of Gaussians which will be kept after lucky Imaging (i.e. 0.2 is 20%)
end

