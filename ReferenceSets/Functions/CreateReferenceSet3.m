function [ output ] = CreateReferenceSet3( config )
    % Create Reference Set 3
    % Create the static simulated images at different SNR ratios.
   
    fprintf('Simulating the helicase images for reference set 3.\n')
    helicaseImages{1} = CreateHelicaseImage3(config);
    output.helicaseImage{1} = helicaseImages{1}.noiseImage;
    
    fprintf('The helicase images for reference set 3 have been simulated.\n')
    
    fprintf('Simulating the dna images for reference set 3.\n')
    dnaImages{1} = CreateDnaImage3(config);
    output.dnaImage{1} = dnaImages{1}.noiseImage;

    fprintf('The dna images for reference set 3 have been simulated.\n')
    
    output.helicaseRoi{1} = CreateHelicaseRoi3( config, helicaseImages{1}.cleanImage);
    output.roiCenters = FindRoiCenters( output.helicaseRoi);
    output.dnaRoi{1} = CreateDnaRoi3( config, dnaImages{1}.cleanImage);

    figure; 
    subplot(1,3,1);
    imshow( output.helicaseImage{1}, []); colorbar; title('Helicase Image 3')
    
    subplot(1,3,2); 
    imshow( output.helicaseRoi{1}, []); 
    PlotCenters( output.roiCenters{1}, 10)
    title('Helicase ROI with centers')
    
    subplot(1,3,3); 
    imshow( output.helicaseImage{1}, []); colorbar; title('Helicase Image 3')
    PlotCenters( output.roiCenters{1}, 10)
    title('Helicase Image with centers')

    figure; 
    subplot(1,2,1); imshow( output.dnaImage{1}, []); colorbar; title('Dna Image 3')    
    subplot(1,2,2); imshow( output.dnaRoi{1}, []); colorbar; title('Dna Roi 3')
end

