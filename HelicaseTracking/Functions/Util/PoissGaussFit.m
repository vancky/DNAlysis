function [ output ] = PoissGaussFit( inputImage, filterOption )
    % Poisson Gaussian Fit - Fits a superpositon of a poisson and Gaussian distribution
    %   Detailed explanation goes here
    
    
    switch filterOption
        case 0
            inputImageFiltered=inputImage;
        case 1    
            inputImageFiltered=inputImage-min(inputImage);
        otherwise
            disp('Please specify a filter option, either 0 or 1')
    end
    
    data=inputImageFiltered(:);
    sortedData=sort(data);
    
    figure; 
    hold on
    h=histogram(inputImageFiltered);
    maxHistogram=max(h.Values);           
    
    lambdaGuess=mean(data);
    bGuess=max(data)/4;              % guess for mu as 1/4 of the total domain covered by the data
    cGuess=max(data)/8;              % guess for sigma as 1/8 of the total domain covered by the data
    x=1:max(data);
    
    start= [ lambdaGuess , bGuess , cGuess ];
    
    custpdf= @(data, lambda ,  b , c) (1./(c*sqrt(2*pi)))*exp(-((data-b).^2)./(2*c^2))+exp(-lambda)*(lambda.^data)./factorial(data);
    
    output.gaussfit=mle(data, 'distribution', 'Normal');
    output.phat=mle(data, 'pdf' , custpdf, 'start', start);
    
    lambdaHat=output.phat(1);
    bHat=output.phat(2);
    cHat=output.phat(3);
    
    y= (1./(cHat*sqrt(2*pi)))*exp(-((x-bHat).^2)./(2*cHat^2))+exp(-lambdaHat)*(lambdaHat.^x)./factorial(x);
    scaleValue= maxHistogram/max(y);
    plot(x,scaleValue*y)
    hold off
    
end

