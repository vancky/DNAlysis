function [ fitGaussian ] = FitGaussianMle( config, data)
    % FitGaussian
    % Takes as input a fluorescent patch called data and 
    % a vector containing the guessing parameters
    % x0= [mu_x , mu_y , I , b]
  
    x0= [ config.brightFinderSize+1 , config.brightFinderSize+1 , config.scaleValue, 0 ];                % the initial guess
    domainSize=2*config.brightFinderSize+1;     % the size of the patch
    k=2*pi/config.waveLength;
    a=config.numFactor;
    
   for i=1:domainSize
        mleData( 1+domainSize*(i-1) : domainSize*i, 1 )= i ;
        mleData( 1+domainSize*(i-1) : domainSize*i, 2 )= 1:9;
    end
    
    mleData(:,3)=data(:);
   
    
    % The minimization function   
    
    model= @( mleData, mux, muy, I, b) ...
            b+abs(I)*exp(-(config.pixelSize^2*a*k^2)*((mleData()-mux).^2+(5-muy).^2)); 
    
    
    %errorFunction = @(x) gaussianFunction(x) - double(data); 
     
    [phat] = mle( mleData(:,3) , 'pdf', model, 'start', x0);
    
    fitGaussian.phat=phat;
    
      
   % option to save first fit as value
%     if count == 1                   % sets the initial guess to the first (succesful) fitted gaussian
%        config.initialGuess=fitGaussian.fit; 
%     end
    
end

