function [ output ] = CreateHelicaseImage2( helicaseImages )
    % Create Helicase Image 2
    % Creates the helicase image for reference set 2

    % Just do some manual cropping of the images
    
    croppedImage{1} = helicaseImages{1}(1:430, 35:245);
    croppedImage{2} = helicaseImages{2}(1:430, 35:245);
    croppedImage{3} = helicaseImages{3}(1:430, 35:245);
    croppedImage{4} = helicaseImages{4}(1:430, 35:245);
    croppedImage{5} = helicaseImages{5}(1:430, 35:245);
     
    % Code to visualise the cropping
%     for i = 1:5
%         figure; 
%         subplot(1,2,1);
%         imshow( croppedImage{i}, [100 150]); colorbar;
%         title( sprintf('Cropped Image %i', i)); 
%         subplot(1,2,2);
%         imshow( helicaseImages{i}, [100 150]); colorbar;
%         title( sprintf('Helicase Image %i', i)); 
%     end
    
    output = croppedImage;
end

