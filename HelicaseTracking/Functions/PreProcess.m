function [ output ] = PreProcess( config, importImages )
    % Pre Process - Pre processes the relevant images
    % Detailed explanation goes here

    switch config.importType
        case 'OneCamera'
            for ii = 1: config.numFovs
                output.oneCamera{ii} = PreProcessOneCamera( config, importImages.helicase{ii}, importImages.dna{ii}); 
                %output.reference{ii} = PreProcessReference( importImages.helicase{ii}, importImages.dna{ii}, 'nofilter' ); 
            end

        case 'TwoCameras'        
            for ii =1:config.numFovs
                output.twoCameras{ii} = PreProcessTwoCameras( config, importImages.cam0{ii}, importImages.cam1{ii});
            end

        otherwise
            fprintf('Please specify a correct importType, either ''OneCamera'' or ''TwoCameras''.\n')
    end
end

