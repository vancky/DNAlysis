function [ output ] = HelicaseIntensityFinder( spotFinder , helicaseImage )
    % Helicase Intensity Finder - Finds the intensity of helicases found by
    % the SpotFinder.
    
    L = length( spotFinder.circle );
    intensity=zeros(L,1);
    
    for i= 1:L 
        
        location = round( spotFinder.circle(i).centers); % note this is [X,Y] so [col , row]
        radius = round( spotFinder.circle(i).radii);
        filter = fspecial('disk' , radius);
        
        % use a larger helicase image to make sure that the boundaries dont
        % cause a problem
        
        helicaseSize = 2*radius+1;
        helicaseSizeReal = 2*(spotFinder.circle(i).radii)+1;
        helicase= zeros( helicaseSize );
        
        for ii= 1: helicaseSize
            for j=1: helicaseSize 
                if (location(2)-radius+1+ii >0)&& (location(2)-radius+1+ii < size(helicaseImage , 1) ) ...
                   && (location(1)-(radius+1)+j >0) &&  (location(1)-(radius+1)+j < size(helicaseImage , 2))
                helicase(ii,j) = helicaseImage(location(2) - (radius+1)+ii, location(1)-(radius+1)+j);
                end
            end
        end
        
        product = helicase.*filter;
        intensity(i) = helicaseSizeReal^2*sum( product(:) );
    end
    
   
    figure;
    histogram(intensity , 100)
    title('Intensity Distribution of Helicases')
    xlabel('Pixel counts per Helicase')
    ylabel('Number of helicases')
    
    output.helicase = helicase;
    output.filter = filter;
    output.intensity = intensity;

end

