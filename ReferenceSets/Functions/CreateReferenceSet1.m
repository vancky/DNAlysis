function [ output ] = CreateReferenceSet1( config )
    % Create Reference Set 1
    % Create the helicase and dna image for reference set 1
    
    output.helicaseImage{1} = CreateHelicaseImage1(config);
    output.helicaseRoi{1} = CreateHelicaseRoi1(config, output.helicaseImage{1});
    output.dnaImage{1} = []; %CreateDnaImage1(config)
    
    % This section can be uncommented to see which images are imported
    figure;
    subplot(1,2,1); imshow( output.helicaseImage{1}, [0 30]); colorbar; title('Helicase Image 1')
    subplot(1,2,2); imshow( output.helicaseRoi{1}); title('Helicase ROI')
end

