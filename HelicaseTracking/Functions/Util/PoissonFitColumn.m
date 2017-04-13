function [ lambdaHat ] = PoissonFitColumn( inputImage )
    % Poisson Fit Column - Fits a poisson distribution to every column of
    % the image
    %   Detailed explanation goes here
    inputImage=inputImage-min(inputImage);
    
    numColumns=size(inputImage,2);
    lambdaHat=zeros(1,numColumns);
    for i=1:numColumns       
        lambdaHat(1,i)=poissfit(inputImage(:,i));
    end
    figure;
    plot( 1:numColumns , lambdaHat )
    title('Poisson parameter for every column')
    xlabel('column')    
    ylabel('Poisson parameter lambda')
    xlim([0 numColumns])
    
    figure;
    fourierLambda=fft(lambdaHat-mean(lambdaHat));    
    P2=abs(fourierLambda/numColumns);
    P1=P2(1:numColumns/2+1);
    P1(2:end-1)=2*P1(2:end-1);
    plot( 1:length(P1) , P1)
end

