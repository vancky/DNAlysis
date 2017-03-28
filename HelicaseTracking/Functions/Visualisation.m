function [ output_args ] = Visualisation( config, simulateImages , helicaseFitter , analysis, avg, maximum )
    %VISUALISATION Summary of this function goes here
    %   Detailed explanation goes here

     figure
     hold on
     plot(1:config.numFrames, 1e9*analysis{1}.errorMeters(:,1))
     plot(1:config.numFrames, 1e9*analysis{1}.errorMeters(:,2))
     plot(1:config.numFrames, 1e9*analysis{1}.errorMeters(:,3))
     hold off
     title('Pixelation error')
     legend('x-error','y-error','absolute error')
     xlabel('Frame')
     ylabel('Error (nm)')

     
     figure
     hold on
     plot(5:40, 1e9*avg);
     plot(5:40, 1e9*maximum);
     hold off
     title('Error due to limited photon count')
     legend('average error','maximum error')
     xlabel('Maximum photon count')
     ylabel('Error (nm)')
%     for i=1:5
%        ydot=helicaseFitter.fitLocation(10*i,1);
%        xdot=helicaseFitter.fitLocation(10*i,2);
%        
%        figure;
%        
%        imshow(simulateImages.simulateHelicases.image{10*i},[])
%        hold on
%        
%        plot(xdot, ydot, 'r.' , 'MarkerSize' , 5);
%        hold off
%              
%       end
end

