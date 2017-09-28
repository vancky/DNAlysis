function [ output ] = CreateReferenceSet2( config, rawImages )
    % Create Reference Set 2
    % Create the helicase and dna image for reference set 2
    
    helicaseImages = rawImages.helicase;
    dnaImages = rawImages.dna;
        
    output.helicaseImage = CreateHelicaseImage2( helicaseImages);
    output.helicaseRoi = CreateHelicaseRoi2( config, output.helicaseImage);
    output.roiCenters = FindRoiCenters( output.helicaseRoi);

    output.dnaImage = CreateDnaImage2( dnaImages);
    output.dnaRoi = CreateDnaRoi2( config, output.dnaImage);
    
    for i = 1:length(output.helicaseImage) 
        figure; 
        subplot(1,3,1);
        imshow( output.helicaseImage{i}, [0 30]); colorbar; title(sprintf('Helicase Image %i', i))
        axis equal; axis tight;
        subplot(1,3,2);
        imshow( output.helicaseRoi{i}); 
        axis equal; axis tight;
        PlotCenters( output.roiCenters{i}, 10)
        title('Helicase ROI with centers')
        subplot(1,3,3);
        imshow( output.helicaseImage{i}, [0 30]); colorbar;
        axis equal; axis tight;
        PlotCenters( output.roiCenters{i}, 10)
        title('Helicase Image with centers')
    end
    
    for j = 1:length(output.dnaImage)
        figure; 
        subplot(1,2,1)
        imshow( output.dnaImage{j}, [0 1500]); colorbar; title(sprintf('Dna Image %i', j))
        axis equal; axis tight;
        subplot(1,2,2)
        imshow( output.dnaRoi{j}); title(sprintf('Dna ROI %i', j))
        axis equal; axis tight;
    end
    
    figure; 
    imshow( output.dnaImage{3}, [0 1500]); colorbar;
    axis equal; axis tight;
    
    figure; 
    imshow( output.dnaRoi{3});
    axis equal; axis tight;
    
    figure; 
    imshow( output.helicaseImage{1}, [0 30]); colorbar;
    axis equal; axis tight;
    
    figure;
    imshow( output.helicaseRoi{1}); 
    axis equal; axis tight;
    PlotCenters( output.roiCenters{1}, 10)
        
end

