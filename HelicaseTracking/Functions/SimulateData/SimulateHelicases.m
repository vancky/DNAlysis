function [ output ] = SimulateHelicases( config )
    % Simulate Helicases - generate an individual helicase moving along several images
    %   Detailed explanation goes here
    
    %Determine the helicase velocity in pixels/frame
    velocity=config.helicaseVelocity*config.exposureTime*config.pixels/config.imageSize;
    xvelocity=velocity/sqrt(4/3);   
    yvelocity=velocity/sqrt(4);

    % Generate a matrix with positions of the helicases
    for i=1:config.numHelicases
        % Generate a helicase at a random postion [X,Y]
        helicase{i}.position= [ randi([1+10,config.pixels-10])+randn(1) ; randi([1+10,config.pixels-10])+randn(1) ];
        for k=1:(config.numFrames-1)                       
            helicase{i}.position(1,k+1) = helicase{i}.position(1,k)+xvelocity;           % Update the X position
            helicase{i}.position(2,k+1) = helicase{i}.position(2,k)+yvelocity;                    % Update the Y position
            
            output.position{i}=helicase{i}.position';  
        end
        
    end
    
    
    
    for k=1:config.numFrames
       sumImage=zeros( config.pixels , config.dataType );

       for i=1:config.numHelicases 
           helicase{i}.parameters(3)=config.sigma;                                   % set sigma and the scaleValue
           helicase{i}.parameters(4)=config.scaleValue;                                   % set sigma and the scaleValue
           helicase{i}.parameters(1:2)=helicase{i}.position(1:2,k);                            % Update the X,Y position
           gaussian=uint16(GenerateGaussian(config.pixels, helicase{i}.parameters));           % Generate the helicase as gaussians, inputs are (size , [mu_x , mu_y , sigma , scaleValue])
           sumImage=sumImage+gaussian;
       end
       output.image{k}=sumImage;
    end
       
end

