function [ analysis ] = Analysis( config, simulateImages, helicaseFitter  )
    %ANALYSIS - Post analysis for the helicase fitting
    %   Detailed explanation goes here
  
    % Compare the fitted versus real  locations
    for i=1:config.numHelicases
        
        realLocation=simulateImages.simulateHelicases.position{i};  %[X,Y]
        fittedLocation=fliplr(helicaseFitter.fitLocation);          %fliplr to get [X,Y]
        
        
        analysis.errorPixels=realLocation-fittedLocation;
        analysis.errorPixels(:,3)=sqrt(analysis.errorPixels(:,1).^2+analysis.errorPixels(:,2).^2);
        analysis.errorMeters=analysis.errorPixels*config.pixelSize; 
    end
    analysis.std=std(analysis.errorMeters(:,3));
    analysis.bias=mean(analysis.errorMeters(:,3));

end

