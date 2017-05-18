function [ output ] = VisualiseHelicases( originalImage , luckyImage )
    % Visualise Helicases - Visualises helicases
    % 
    
    scale1 = [34 50];
    scale2 = [0 2];
    scale3 = [10 50];
    
    
    
    figure; 
    subplot(1,3,1); imshow( originalImage , scale1 ); colorbar;
    subplot(1,3,2); imshow( RollingBallFilter(originalImage,30 ) , scale2 ); colorbar ;
    subplot(1,3,3); imshow( luckyImage , scale3 ); colorbar ;
    
    
    ShowSequence( RollingBallFilter(luckyPre.stackHelicases,30) , 0.1)


end

