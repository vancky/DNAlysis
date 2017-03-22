function [ output_args ] = Visualisation( config, simulateImages )
    %VISUALISATION Summary of this function goes here
    %   Detailed explanation goes here

    for i=1:10
       figure;
       imshow(simulateImages.simulateHelicases.image{i},[])
    end
end

