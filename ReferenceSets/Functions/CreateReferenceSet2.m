function [ output ] = CreateReferenceSet2( config )
    % Create Reference Set 2
    % Create the helicase and dna image for reference set 2
    
    fprintf('Importing the helicase Images for reference set 2.\n')
    helicaseImages = ImportOneCamera( config.referenceSet2HelicaseCd, 'stack' );
    fprintf('The helicase images for reference set 2 have been imported.\n')
    
    fprintf('Importing the dna Images for reference set 2.\n')
    dnaImages = ImportOneCamera( config.referenceSet2DnaCd, 'stack' );
    fprintf('The dna images for reference set 2 have been imported.\n')
      
    output.helicaseImage = CreateHelicaseImage2(helicaseImages);
    output.dnaImage = CreateDnaImage2(dnaImages);
    output.helicaseRoi = CreateHelicaseRoi2(config, output.helicaseImage);
    output.roiCenters = FindRoiCenters( output.helicaseRoi);
    
    %output.dnaRoi = CreateDnaRoi2()
    
    for i = 1: length(output.helicaseImage) 
        figure; 
        subplot(1,3,1);
        imshow( output.helicaseImage{i}, [0 40]); colorbar; title(sprintf('Helicase Image %i', i))
        subplot(1,3,2);
        imshow( output.helicaseRoi{i}); 
        PlotCenters( output.roiCenters{i}, 10)
        title('Helicase ROI with centers')
        subplot(1,3,3);
        imshow( output.helicaseImage{i}, [0 40]); colorbar;
        PlotCenters( output.roiCenters{i}, 10)
        title('Helicase Image with centers')
    
        figure; 
        imshow( output.dnaImage{i}, []); colorbar; title(sprintf('Dna Image %i', i))
    end
end

