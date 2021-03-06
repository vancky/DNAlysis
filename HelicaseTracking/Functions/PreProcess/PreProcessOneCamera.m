function [ output ] = PreProcessOneCamera( config , helicaseImageRaw , dnaImageRaw )
    % Pre Process - Pre processes data before the lucky algorithm
    % Detailed explanation goes here

    N = size( helicaseImageRaw , 3 );
    M = size( dnaImageRaw , 3 );
    helicaseImageSmooth = 0;
    dnaImageSmooth = 0;
    rowCorrect = 430;  % FIX TO CORRECT FOR THE MISALIGNED IMAGE PART, remove this later!
    
    for i=1:N
        cropHelicase = CropSplitImage( config , helicaseImageRaw(:,:,i) );
        % Note the fix is also in here should be  helicaseImage=double(cropHelicase.leftImage); 
        helicaseImage = double( cropHelicase.leftImage( 1:rowCorrect , : )); 
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
        cropDna = CropSplitImage( config , dnaImageRaw(:,:,j) );
        % Note the fix is also in here should be  dnaImage=double(cropDna.rightImage); 
        dnaImage = double( cropDna.rightImage( 1:rowCorrect , : ));
        output.dnaImageRaw = helicaseImage;
        
        dnaSmooth = BallSmooth( dnaImage , 50) ;
        dnaCorrection = max(dnaSmooth(:))./dnaSmooth;
        dna(:,:,j)= dnaCorrection.*dnaImage;
        dnaImageSmooth = dnaImageSmooth+dna(:,:,j);
        dnaImageFilter = BackgroundFilter( dnaImageSmooth );
    end
    
%     figure;
%     subplot(1,2,1); imshow( helicaseImage , [100 120]); colorbar
%     subplot(1,2,2); imshow( dnaImage , [] ) ; colorbar
%     figure;
%     subplot(1,2,1); imshow( helicaseImageFilter , [0 50]); colorbar
%     subplot(1,2,2); imshow( dnaImageFilter , []); colorbar
    
     
    output.dnaImage = dnaImageFilter/N;
    output.helicaseImage = helicaseImageFilter/M;
    
    
end

