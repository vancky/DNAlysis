function [ output ] = PreProcessReference(  helicaseImageRaw, dnaImageRaw, option )
    % Pre Process the Reference Sets, these require less than the normal
    % data
    
    switch option
        case 'filter' 

        N = size( helicaseImageRaw , 3 );
        M = size( dnaImageRaw , 3 );
        helicaseImageSmooth = 0;
        dnaImageSmooth = 0;

        for i=1:N
            helicaseImage = double( helicaseImageRaw); 
            output.helicaseImageRaw = helicaseImage;
            helicaseImageNoScale = BackgroundFilterNoScale( helicaseImage );
            output.helicaseImageNoScale = helicaseImageNoScale;

            helicaseSmooth = BallSmooth( helicaseImage , 50) ;          % may cause distortions near very intense helicases spots.
            helicaseCorrection = max(helicaseSmooth(:))./helicaseSmooth;   
            helicases(:,:,i)= helicaseCorrection.*helicaseImage;
            helicaseImageSmooth = helicaseImageSmooth+helicases(:,:,i);
            helicaseImageFilter = BackgroundFilter( helicaseImageSmooth );
        end

        for j=1:M
            dnaImage = double( dnaImageRaw);
            output.dnaImageRaw = dnaImage;

            dnaSmooth = BallSmooth( dnaImage , 50) ;
            dnaCorrection = max(dnaSmooth(:))./dnaSmooth;
            dna(:,:,j)= dnaCorrection.*dnaImage;
            dnaImageSmooth = dnaImageSmooth+dna(:,:,j);
            dnaImageFilter = BackgroundFilter( dnaImageSmooth );
        end

        figure;
        subplot(1,2,1); imshow( helicaseImage , [100 120]); colorbar
        subplot(1,2,2); imshow( dnaImage , [] ) ; colorbar
        figure;
        subplot(1,2,1); imshow( helicaseImageFilter , [0 50]); colorbar
        subplot(1,2,2); imshow( dnaImageFilter , []); colorbar
        output.dnaImage = dnaImageFilter/N;
        output.helicaseImage = helicaseImageFilter/M;
        
        case 'nofilter'
        
        output.helicaseImageNoScale = double(helicaseImageRaw);
        output.helicaseImage = double(helicaseImageRaw);
        output.dnaImage = double(dnaImageRaw);
            
        otherwise
            
        fprintf('Please specify filter or nofilter for the PreProcessReference function.\n')
    end
        
    

    
end

