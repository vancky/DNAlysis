function [ output_args ] = VisualisationSIMULATIONS( config, simulateImages , helicaseFitter , analysis, post )
    %VISUALISATION Summary of this function goes here
    %   Detailed explanation goes here

    figure
    hold on
    %plot(1:config.numFrames, 1e9*analysis.errorMeters(:,1))
    %plot(1:config.numFrames, 1e9*analysis.errorMeters(:,2))
    %legend('x-error','y-error','absolute error')
    plot(1:config.numFrames, 1e9*analysis.errorMeters(:,3))
    hold off
    title(sprintf('Maximum photon count %d', config.scaleValue))
    legend('absolute error')
    xlabel('Frame')
    ylabel('Error (nm)')

   

    for i=1:5
       ydot=helicaseFitter.fitLocation(10*i,1);
       xdot=helicaseFitter.fitLocation(10*i,2);

       figure;

       imshow(simulateImages.noiseImage(:,:,10*i),[])
       hold on

       plot(xdot, ydot, 'r.' , 'MarkerSize' , 5);
       hold off
    end
    
    figure;
    subplot(2,2,1); imshow( simulateImages.simulateHelicases.image{1} , [] ); title('Helicase Simulation')
    subplot(2,2,2); imshow( simulateImages.noiseImage(:,:,1) , [] ); title('Add Noise')
    ydot=helicaseFitter.fitLocation(1,1);
    xdot=helicaseFitter.fitLocation(1,2);
    subplot(2,2,3); imshow( simulateImages.noiseImage(:,:,1) , [] ); title('Track the Helicase')
    hold on
    plot(xdot, ydot, 'r.' , 'MarkerSize' , 5);
    hold off
    subplot(2,2,4); imshow( simulateImages.noiseImage(:,:,1) , [] ); title('Zoom in')
    hold on
    plot(xdot, ydot, 'r.' , 'MarkerSize' , 20);
    hold off
    
end

