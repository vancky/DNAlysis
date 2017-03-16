function [ lucky ] = Lucky( clean, config )
    %Lucky Summary of this function goes here
    %   Detailed explanation goes here
    
    N=config.numStacks;
    
    for i=1:N
      lucky{i}.initLength=size(clean{i}.outputArray,2);
      count=1;
        for k=1:lucky{i}.initLength
            if 1 %clean{i}.outputArray{2,k}<config.luckyThreshold
               lucky{i}.gaussians{1,count}=clean{i}.outputArray{1,k};
               lucky{i}.index{1,count}=clean{i}.indexCheck{1,k+1};
               count=count+1;
            end
        end
       lucky{i}.finalLength=size(lucky{i}.gaussians,2);
    end


     for i=1:N
        lucky{i}.image=zeros(config.imageSize);
          for k=1:lucky{i}.finalLength
             
              lucky{i}.image=lucky{i}.image+GenerateLuckyGaussian(config, lucky{i}.index{1,k}, lucky{i}.gaussians{1,k});  
          end
     end
    
    
%      lucky{1}.sumImages=zeros(config.imageSize,config.dataType);
%      for i=1:N
%          lucky{1}.sumImages=lucky{1}.sumImages+lucky{i}.image;
%      end
    
end

