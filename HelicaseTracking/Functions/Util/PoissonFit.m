function [ output ] = PoissonFit( inputImage , fitoption,  expTime , cameraNumber )
    % Poisson Fit - Fits a poisson Distribution to an image
    % Give as inputs the image and as a second argument you can choose
    % whether you want to normalise the image,(set the minimum of the image to 0). 
    % input 0 for no normalisation and 1 for normalisation.
    % For instance PoissonFit(inputImage , 1) fits a poisson distribution
    % to the normalised image.
    
    data=inputImage(:);
    xMin=0;
    xMax=ceil(max(data));
    x=linspace( xMin , xMax , (xMax-xMin)+1 );
    

    switch fitoption
        case 1
            lambdaHat= poissfit(data);
            y=exp(-lambdaHat)*(lambdaHat.^x)./factorial(x);  
        case 2
            

            custpdf= @(data, lambda , a) exp(-lambda)*(lambda.^(data-round(a))./factorial(data-round(a)));
            lambdaGuess=mean(data);
            aGuess=0;
            start= [ lambdaGuess ,aGuess ];
            pHat=mle(data, 'pdf' , custpdf, 'start', start);
            lambdaHat=pHat(1)
            aHat=90;
            x=x-aHat
            y=exp(-lambdaHat)*(lambdaHat.^(x-round(aHat))./factorial(x-round(aHat)));
        otherwise
    end
    
    figure;
    subplot(1,2,1)
    imshow( inputImage ,[] )
    text=sprintf('The shotnoise image %ims camera %i', expTime , cameraNumber);
    title( text )
    
    subplot(1,2,2)
    hold on
    edges=[xMin, linspace( xMin+0.5 , xMax-0.5 , (xMax-xMin))];
    h=histogram(inputImage,'BinEdges', edges );
    scaleFactor=max(h.Values)/max(y);
    plot(x,scaleFactor*y,'*')
    title('Poisson Fit to Shot Noise')
    xlabel('Photon Intensity')
    ylabel('Counts')
    hold off

end

