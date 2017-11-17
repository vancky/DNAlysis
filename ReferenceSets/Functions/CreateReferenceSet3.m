function [ output ] = CreateReferenceSet3( config )
    % Create Reference Set 3
    % Create the static simulated images at different SNR ratios.
   
    numSimulations = 1000;
    fprintf('Simulating the images for reference set 3.\n')

    for ii = 1:numSimulations
        fprintf( 'Progress %i/%i.\n', ii, numSimulations)
        helicaseImages{ii} = CreateHelicaseImage3(config);
        output.helicaseImage{ii} = uint16( helicaseImages{ii}.noiseImage);
        output.roiCenters{ii} = helicaseImages{ii}.roiCenters;
        
        dnaImages{ii} = CreateDnaImage3(config);
        output.dnaImage{ii} = uint16( dnaImages{ii}.noiseImage);
        output.dnaRoi{ii} = CreateDnaRoi3( config, dnaImages{ii}.cleanImage);
        output.dnaRoi{ii} = uint16( output.dnaRoi{ii});
        
    end
    
    fprintf('The images for reference set 3 have been simulated.\n')
    
    figure; 
    subplot(1,2,1);
    imshow( output.helicaseImage{1}, []); colorbar; title('Helicase Image 3')
    
    subplot(1,2,2); 
    imshow( output.helicaseImage{1}, []); colorbar; title('Helicase Image 3')
    PlotCenters( output.roiCenters{1}, 10)
    title('Helicase Image with centers')

    figure; 
    subplot(1,2,1); imshow( output.dnaImage{1}, []); colorbar; title('Dna Image 3')    
    subplot(1,2,2); imshow( output.dnaRoi{1}, []); colorbar; title('Dna Roi 3')
end

