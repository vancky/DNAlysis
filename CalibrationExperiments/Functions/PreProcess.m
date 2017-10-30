function [ config, output ] = PreProcess( config, inputImages )
    % Pre Process - Performs pre processing either for the mcm or rpa
    % calibrations
    
    switch config.calibrationExperiment
        case 'mcm'
            [config, output] = PreProcessMcm( config, inputImages.helicase{1});
            
        case 'rpa'
            for jj = 1:config.numFovs
                output{jj} = PreProcessRpa( config, inputImages.helicase{jj});
                config.numFrames{jj} = size( output{jj}, 3);
            end
            
        otherwise
            fprintf( ['Please specify a correct calibration experiment' ...
                       'either mcm or rpa.\n']);
    end
    
end

