function [ stackImages ] = StackImages( importImages , config )
%STACKIMAGES Summary of this function goes here
%   Detailed explanation goes here
    numStacks=importImages.numFiles/config.stackSize;
    for i=1:numStacks
        stackImages.image{i}=zeros(config.imageSize,config.dataType);
        for k=1:config.stackSize
            stackImages.image{i}=stackImages.image{i}+importImages.image{(i-1)*config.stackSize+k};
        end
        stackImages.image{i}=stackImages.image{i}/config.stackSize;
    end

end

