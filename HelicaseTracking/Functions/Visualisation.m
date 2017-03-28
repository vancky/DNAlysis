function [ output_args ] = Visualisation( config, simulateImages , helicaseFitter , analysis )
    %VISUALISATION Summary of this function goes here
    %   Detailed explanation goes here

     figure
     hold on
     plot(1:config.numFrames, 1e9*analysis.errorMeters(:,1))
     plot(1:config.numFrames, 1e9*analysis.errorMeters(:,2))
     plot(1:config.numFrames, 1e9*analysis.errorMeters(:,3))
     hold off
     title('Pixelation error')
     legend('x-error','y-error','absolute error')
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
end

