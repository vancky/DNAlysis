function [ lucky ] = Lucky( clean, config )
    %Lucky Summary of this function goes here
    %   Detailed explanation goes here
    
    N=config.numStacks;
    
    for i=1:N                       %Select the Gaussians which we want.
      lucky{i}.startLength=size(clean{i}.output.resnorm,2);
      count=1;
      resnormSorted=sort(clean{i}.output.resnorm);
      index=round(config.luckyThreshold*lucky{i}.startLength);         % find the index where to put the threshold
      threshold=resnormSorted(index);
      
        for k=1:lucky{i}.startLength
            if clean{i}.output.resnorm(k)<threshold
               lucky{i}.gaussian{count}=clean{i}.output.matrix{k};
               lucky{i}.index{count}=clean{i}.output.index{k};
               count=count+1;
            end
        end
       lucky{i}.finalLength=size(lucky{i}.gaussian,2);
    end


     for i=1:N
        fprintf('Stacking Lucky Gaussians %d/%d. \n' , i , N )
        
        stackImage= zeros(config.imageSize, config.dataType);
          for k=1:lucky{i}.finalLength
              gaussian=lucky{i}.gaussian{k};
              index=lucky{i}.index{k};
              stackImage=stackImage+GenerateLuckyGaussian(config, gaussian, index);  
          end
          lucky{i}.image=stackImage;
          lucky{i}.imageInverted=clean{i}.imageGaussian-stackImage;
     end
    
end

