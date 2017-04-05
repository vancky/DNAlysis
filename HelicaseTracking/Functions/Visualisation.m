function [ output_args ] = Visualisation( config, simulateImages , helicaseFitter , analysis, post )
    %VISUALISATION Summary of this function goes here
    %   Detailed explanation goes here

%         figure
%         hold on
%         plot(1:config.numFrames, 1e9*analysis.errorMeters(:,1))
%         plot(1:config.numFrames, 1e9*analysis.errorMeters(:,2))
%         plot(1:config.numFrames, 1e9*analysis.errorMeters(:,3))
%         hold off
%         title(sprintf('Maximum photon count %d', config.scaleValue))
%         legend('x-error','y-error','absolute error')
%         xlabel('Frame')
%         ylabel('Error (nm)')
        
        figure;
        hold on
        errorbar(post.scaleValue, 1e9*post.biasAvg , 1e9*post.errorBias)
        errorbar(post.scaleValue, 1e9*post.sigmaAvg, 1e9*post.errorSigma)
        hold off
        title('Error due to Pixelation in a Noiseless Environment')
        legend('Bias','Standard deviation')
        xlabel('Signal to Noise Ratio')
        ylabel('Tracking Errors (nm)')
        ylim([0 4])
        xlim([10 100])
        yticks([0 1  2 3 4])
        grid
        

%         figure;
%         hold on
%         plot(scaleValue, 1e9*bias)
%         plot(scaleValue, 1e9*std)
%         hold off
%         title('Errors due to Pixelation in a Noiseless Environment')
%         legend('Bias','Standard deviation')
%         xlabel('Maximum Photon Count')
%         ylabel('Tracking Errors (nm)')
%         ylim([0 4])
%         xlim([10 100])
%         yticks([0 1 2 3 4])
%         grid
        
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

