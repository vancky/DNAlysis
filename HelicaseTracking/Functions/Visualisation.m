function [ output_args ] = Visualisation( config, simulateImages , helicaseFitter )
    %VISUALISATION Summary of this function goes here
    %   Detailed explanation goes here

    for i=1:10
       ydot=helicaseFitter.fitLocation(10*i,1);
       xdot=helicaseFitter.fitLocation(10*i,2);
       
       figure;
       
       imshow(simulateImages.simulateHelicases.image{10*i},[])
       hold on
       
       plot(xdot, ydot, 'r.' , 'MarkerSize' , 5);
       hold off
             
    
      end
end

