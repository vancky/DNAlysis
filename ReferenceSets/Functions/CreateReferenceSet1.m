function [ output ] = CreateReferenceSet1( config)
    % Create Reference Set 3
    % Create the static simulated images at different SNR ratios.
   
    fprintf('Simulating the helicase images for reference set 1.\n')
    output.helicaseImage{1} = CreateHelicaseImage1(config);
    fprintf('The helicase images for reference set 1 have been simulated.\n')
    
    fprintf('Simulating the dna images for reference set 1.\n')
    output.dnaImage{1} = CreateDnaImage1(config);
    fprintf('The dna images for reference set 1 have been simulated.\n')
    
    output.helicaseRoi{1} = CreateHelicaseRoi3( config, output.helicaseImage{1});
    output.roiCenters = FindRoiCenters( output.helicaseRoi);
    output.dnaRoi{1} = CreateDnaRoi3( config, output.dnaImage{1});

    figure; 
    subplot(1,3,1);
    imshow( output.helicaseImage{1}, []); colorbar; title('Helicase Image Ref Set 1')
    
    subplot(1,3,2); 
    imshow( output.helicaseRoi{1}, []); 
    PlotCenters( output.roiCenters{1}, 10)
    title('Helicase ROI with centers')
    
    subplot(1,3,3); 
    imshow( output.helicaseImage{1}, []); colorbar; title('Helicase Image Ref Set 1')
    PlotCenters( output.roiCenters{1}, 10)
    title('Helicase Image with centers')

    figure; 
    subplot(1,2,1); imshow( output.dnaImage{1}, []); colorbar; title('Dna Image Ref Set 3')    
    subplot(1,2,2); imshow( output.dnaRoi{1}, []); colorbar; title('Dna Roi Ref Set 3')
end

