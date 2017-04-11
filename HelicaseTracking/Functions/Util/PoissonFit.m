function [ output ] = PoissonFit( inputImage , filterOption )
    % Poisson Fit - Fits a poisson Distribution to an image
    % Give as inputs the image and as a second argument you can choose
    % whether you want to normalise the image,(set the minimum of the image to 0). 
    % input 0 for no normalisation and 1 for normalisation.
    % For instance PoissonFit(inputImage , 1) fits a poisson distribution
    % to the normalised image.
    
    switch filterOption
        case 0
            inputImageFiltered=inputImage;
        case 1    
            inputImageFiltered=inputImage-min(inputImage);
        otherwise
            disp('Please specify a filter option, either 0 or 1')
    end
    
    data=inputImageFiltered(:);
    lamdaHat= poissfit(data);
    xMin=min(data);
    xMax=max(data);
    x=xMin:xMax;
    y=poisspdf(x, lamdaHat);
    
    figure;
    subplot(1,2,1)
    imshow( inputImageFiltered ,[] )
    title('The shotnoise image 50ms Camera 0 ')
    
    subplot(1,2,2)
    hold on
    h=histogram(inputImageFiltered);
    scaleFactor=max(h.Values)/max(y);
    plot(x,scaleFactor*y,'-')
    title('Poisson Fit to Shot Noise')
    xlabel('Photon Intensity')
    ylabel('Counts')
    hold off

end

