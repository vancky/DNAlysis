function [ output ] = GaussianMleFit( data , domain , nbins )
    % Gaussian MLE Fit - Fits 1 and 2 gaussians to a distribution
    % Input the data, the domain where you want to plot the results 
    % [xmin , xmax ] , and finally the nbins for the histogram
   
    x = linspace( domain(1) , domain(2) , nbins );
    
    custpdf1= @(data, mu1 , sigma1) normpdf( data , mu1 , sigma1);
    custpdf2= @(data, mu1 , mu2 , sigma1 , sigma2) normpdf(data , mu1 , sigma1)+ normpdf(data , mu2 , sigma2);
    custpdf3= @(data, mu1 , mu2 , mu3 , sigma1 , sigma2 , sigma3) ...
        normpdf(data , mu1 , sigma1)+ normpdf(data , mu2 , sigma2)+ normpdf(data , mu3 , sigma3);
    custpdf4= @(data, mu1 , mu2 , mu3 , mu4 , sigma1 , sigma2 , sigma3 , sigma4) ...
        normpdf(data , mu1 , sigma1)+ normpdf(data , mu2 , sigma2)+ normpdf(data , mu3 , sigma3)+normpdf(data , mu4 , sigma4);
    
    muStart2 = quantile( data , [.33 .67]);
    sigmaStart = sqrt( var(data) - .25*diff(muStart2).^2 );
    
    muStart3 = quantile( data , [.25 , .5 , .75]);
    muStart4 = quantile( data , [.2 , .4 , .6 , .8]);
    
    start1= [ max(data)/4, max(data)/8 ];
    start2 = [ muStart2 , sigmaStart , sigmaStart ];
    start3 = [ muStart3 , sigmaStart , sigmaStart , sigmaStart ];
    start4 = [ muStart4 , sigmaStart , sigmaStart , sigmaStart , sigmaStart ];
    
    lb1 = [ -Inf , 0];
    ub1 = [ Inf , Inf];
    lb2 = [ -Inf , -Inf , 0 ,  0 ];
    ub2 = [ Inf , Inf , Inf , Inf ];
    lb3 = [ -Inf , -Inf, -Inf , 0 , 0 ,  0 ];
    ub3 = [ Inf , Inf , Inf , Inf , Inf , Inf ];
    lb4 = [ -Inf , -Inf, -Inf , -Inf , 0, 0 , 0 ,  0 ];
    ub4 = [ Inf , Inf , Inf , Inf , Inf , Inf , Inf , Inf ];
    
    options = statset('MaxIter' , 1e4 , 'MaxFunEvals' , 2e4);
    
    phat1 = mle(data, 'pdf' , custpdf1, 'start', start1 , 'lower' , lb1, 'upper' , ub1 , 'options' , options);
    output.fitValues1 = phat1;
    phat2 = mle(data, 'pdf' , custpdf2, 'start', start2 , 'lower' , lb2, 'upper' , ub2 , 'options' , options);
    output.fitValues2 = phat2;
    phat3 = mle(data, 'pdf' , custpdf3, 'start', start3 , 'lower' , lb3, 'upper' , ub3 , 'options' , options);
    output.fitValues2 = phat3;
    phat4 = mle(data, 'pdf' , custpdf4, 'start', start4 , 'lower' , lb4, 'upper' , ub4 , 'options' , options);
    output.fitValues2 = phat4;
        
    y1 = normpdf( x , phat1(1) , phat1(2) );
    y2 = normpdf( x , phat2(1) , phat2(3))+ normpdf( x, phat2(2) , phat2(4));
    y3 = normpdf( x , phat3(1) , phat3(4))+ normpdf( x, phat3(2) , phat3(5)) + normpdf( x, phat3(3) , phat3(6));
    y4 = normpdf( x , phat4(1) , phat4(5))+ normpdf( x, phat4(2) , phat4(6)) + normpdf( x, phat4(3) , phat4(7)) + normpdf( x, phat4(4) , phat4(8));
    
    figure;
    histogram( data , nbins , 'Normalization' , 'pdf' , 'BinLimits' , domain);
    hold on
    plot( x , (1/1)*y1 , 'LineWidth' , 1.5)
    plot( x , (1/2)*y2 , 'LineWidth' , 1.5)  
    plot( x , (1/3)*y3 , 'LineWidth' , 1.5) 
    plot( x , (1/4)*y4 , 'LineWidth' , 1.5) 
     
    legend( 'Data','One Gaussian' , 'Two Gaussian' , 'Three Gaussians')
    
end

