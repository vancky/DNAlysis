function [ lucky ] = Lucky( clean, config )
    %Lucky Summary of this function goes here
    %   Detailed explanation goes here
    
    N=config.numStacks;
    
    for i=1:N
      lucky{i}.initLength=size(clean{i}.outputArray,2);
      count=1;
        for k=1:lucky{i}.initLength
            if clean{i}.outputResnorm(k)<1000 %config.luckyThreshold
               lucky{i}.gaussians{1,count}=clean{i}.outputArray{1,k};
               count=count+1;
            end
        end
       lucky{i}.finalLength=size(lucky{i}.gaussians,2);
    end


     for i=1:N
        fprintf('Generating Lucky Gaussians %d/%d. \n' , i , N )
        lucky{i}.image=zeros(config.imageSize);
          for k=1:lucky{i}.finalLength
              lucky{i}.image=lucky{i}.image+GenerateLuckyGaussian(config, lucky{i}.gaussians{k});  
          end
     end
    
end

