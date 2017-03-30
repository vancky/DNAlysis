function [ output_args ] = Visualisation( config, simulateImages , helicaseFitter , analysis, snRatio, bias , std )
    %VISUALISATION Summary of this function goes here
    %   Detailed explanation goes here

%      figure
%      hold on
%      plot(1:config.numFrames, 1e9*analysis.errorMeters(:,1))
%      plot(1:config.numFrames, 1e9*analysis.errorMeters(:,2))
%      plot(1:config.numFrames, 1e9*analysis.errorMeters(:,3))
%      hold off
%      title(sprintf('Maximum photon count %d', config.scaleValue))
%      legend('x-error','y-error','absolute error')
%      xlabel('Frame')
%      ylabel('Error (nm)')
        
        
        figure;
        hold on
        plot(snRatio, 1e9*bias)
        plot(snRatio, 1e9*std)
        hold off
        title('Tracking Errors versus SNR')
        legend('Bias','Standard deviation')
        xlabel('Signal to Noise Ratio')
        ylabel('Tracking Errors (nm)')
        ylim([0 15])
        xlim([3 10])
        yticks([0 2 4 6 8 10 12 14])
        grid
%     for i=1:5
%        ydot=helicaseFitter.fitLocation(10*i,1);
%        xdot=helicaseFitter.fitLocation(10*i,2);
%        
%        figure;
%        
%        imshow(simulateImages.noiseImage(:,:,10*i),[])
%        hold on
%        
%        plot(xdot, ydot, 'r.' , 'MarkerSize' , 5);
%        hold off
%              
%     end
end

