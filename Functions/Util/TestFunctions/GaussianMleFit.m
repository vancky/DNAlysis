function [ output ] = GaussianMleFit( data , plotDomain , nbins )
    % Gaussian MLE Fit - Fits 1 and 2 gaussians to a distribution
    % Input the data, the domain where you want to plot the results 
    % [xmin , xmax ] , and finally the nbins for the histogram
   
    domain = [0 ,max(data)];
    x = domain(1):domain(2);
    
    custpdf1= @(data, mu1 , sigma1) normpdf( data , mu1 , sigma1);
    custpdf2= @(data, mu1 , mu2 , sigma1 , sigma2) normpdf(data , mu1 , sigma1)+ normpdf(data , mu2 , sigma2);
    custpdf3= @(data, mu1 , mu2 , mu3 , sigma1 , sigma2 , sigma3) ...
        normpdf(data , mu1 , sigma1)+ normpdf(data , mu2 , sigma2)+ normpdf(data , mu3 , sigma3);
 
    
    muStart2 = quantile( data , 1/3*(1:2) );
    sigmaStart = sqrt( var(data) - .25*diff(muStart2).^2 );
    
    muStart3 = quantile( data , 1/4*(1:3) );
   
    start1= [ max(data)/4, max(data)/8 ];
    start2 = [ muStart2 , sigmaStart , sigmaStart ];
    start3 = [ muStart3 , sigmaStart , sigmaStart , sigmaStart ];
    
    lb1 = [ -Inf , 0];
    ub1 = [ Inf , Inf];
    lb2 = [ -Inf , -Inf , 0 ,  0 ];
    ub2 = [ Inf , Inf , Inf , Inf ];
    lb3 = [ -Inf , -Inf, -Inf , 0 , 0 ,  0 ];
    ub3 = [ Inf , Inf , Inf , Inf , Inf , Inf ];
        
    options = statset('MaxIter' , 1e4 , 'MaxFunEvals' , 2e4);
    
    phat1 = mle(data, 'pdf' , custpdf1, 'start', start1 , 'lower' , lb1, 'upper' , ub1 , 'options' , options);
    output.fitValues1 = phat1;
    phat2 = mle(data, 'pdf' , custpdf2, 'start', start2 , 'lower' , lb2, 'upper' , ub2 , 'options' , options);
    output.fitValues2 = phat2;
    phat3 = mle(data, 'pdf' , custpdf3, 'start', start3 , 'lower' , lb3, 'upper' , ub3 , 'options' , options);
    output.fitValues3 = phat3;
    
%     y1 = normpdf( x , phat1(1) , phat1(2) );
%     y2 = normpdf( x , phat2(1) , phat2(3))+ normpdf( x, phat2(2) , phat2(4));

    y1 = (1/3)*normpdf( x , phat3(1) , phat3(4));
    y2 = (1/3)*normpdf( x, phat3(2) , phat3(5));
    y3 = (1/3)*normpdf( x, phat3(3) , phat3(6));
    y4 = y1+y2+y3;
        
    figure;
    histogram( data , nbins , 'Normalization' , 'pdf' , 'BinLimits' , domain);
    hold on
    plot( x , y1 , 'LineWidth' , 2)
    plot( x , y2 , 'LineWidth' , 2)  
    plot( x , y3 , 'LineWidth' , 2)  
    plot( x , y4 , 'LineWidth' , 2)  
    
    xlim( [plotDomain(1) , plotDomain(2) ] );

    legend( 'Data','Gaussian One' , 'Gaussian Two' , 'Gaussians Three', 'Sum of Gaussians')
    
end

