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
    
    start1= [ lambdaGuess , bGuess , cGuess ];
    
    custpdf1= @(data, lambda ,  b , c) (1./(c*sqrt(2*pi)))*exp(-((data-b).^2)./(2*c^2))+exp(-lambda)*(lambda.^data)./factorial(data);
    
    output.phat1=mle(data, 'pdf' , custpdf1, 'start', start1);
    
    lambdaHat=output.phat1(1);
    bHat=output.phat1(2);
    cHat=output.phat1(3);
    
    y= (1./(cHat*sqrt(2*pi)))*exp(-((x-bHat).^2)./(2*cHat^2))+exp(-lambdaHat)*(lambdaHat.^x)./factorial(x);
    scaleValue= maxHistogram/max(y);
    plot(x,scaleValue*y)
    title('One Gaussian One Poisson fit')
    hold off
    
    figure; 
    hold on
    h=histogram(inputImageFiltered);
    maxHistogram=max(h.Values);           
    
    lambda1Guess=mean(data);
    lambda2Guess=1.6*mean(data);
    bGuess=max(data)/4;              % guess for mu as 1/4 of the total domain covered by the data
    cGuess=max(data)/8;              % guess for sigma as 1/8 of the total domain covered by the data
    x=1:max(data);
    
    start2= [ lambda1Guess, lambda2Guess , bGuess , cGuess ];
    
    custpdf2= @(data, lambda1, lambda2 ,  b , c) (1./(c*sqrt(2*pi)))*exp(-((data-b).^2)./(2*c^2))+exp(-lambda1)*(lambda1.^data)./factorial(data)+exp(-lambda2)*(lambda2.^data)./factorial(data);
    
    output.phat2=mle(data, 'pdf' , custpdf2, 'start', start2);
    
    lambda1Hat=output.phat2(1);
    lambda2Hat=output.phat2(2);
    bHat=output.phat2(3);
    cHat=output.phat2(4);
    
    y2= (1./(cHat*sqrt(2*pi)))*exp(-((x-bHat).^2)./(2*cHat^2))+exp(-lambda1Hat)*(lambda1Hat.^x)./factorial(x)+exp(-lambda2Hat)*(lambda2Hat.^x)./factorial(x);;
    scaleValue2= maxHistogram/max(y2);
    plot(x,scaleValue2*y2)
    title('One Gaussian Two Poisson fit')

    hold off
    
end

