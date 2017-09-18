function [ output ] = CreateReferenceSet1( config, rawImages )
    % Create Reference Set 1
    % Create the helicase and dna image for reference set 1
    
    
    output.helicaseImage = CreateHelicaseImage1( rawImages.helicase);
    output.helicaseRoi = CreateHelicaseRoi1( config, output.helicaseImage);
    output.roiCenters = FindRoiCenters( output.helicaseRoi);
    
    output.dnaImage{1} = []; %CreateDnaImage1(config, rawImages.dna)
    
    % This section can be uncommented to see which images are imported
    figure;
    subplot(1,3,1); 
    imshow( output.helicaseImage{1}, [0 30]); colorbar; 
    title('Helicase Image 1')
    
    subplot(1,3,2);
    imshow( output.helicaseRoi{1}); 
    PlotCenters( output.roiCenters{1}, 10)
    title('Helicase ROI with centers')
    
    subplot(1,3,3);
    imshow( output.helicaseImage{1}, [0 30]); colorbar;
    PlotCenters( output.roiCenters{1}, 10)
    title('Helicase Image with centers')
    
end

