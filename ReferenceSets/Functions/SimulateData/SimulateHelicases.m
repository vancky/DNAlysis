function [ output ] = SimulateHelicases( config )
    % Simulate Helicases - generate an individual helicase moving along several images
    % Detailed explanation goes here
    
    
    
    
   for i=1:config.numHelicases 
       helicase{i}.parameters(3)=config.sigma;                                   % set sigma and the scaleValue
       helicase{i}.parameters(4)=config.scaleValue;                                   % set sigma and the scaleValue
       helicase{i}.parameters(1:2)=helicase{i}.position(1:2,k);                            % Update the X,Y position
       gaussian=uint16(GenerateSimulationMask(config, helicase{i}.parameters));           % Generate the helicase as gaussians, inputs are (size , [mu_x , mu_y , sigma , scaleValue])
       sumImage=sumImage+gaussian;
   end
    
   
       
end

