function [ output ] = GaussianMleFit( data , plotDomain , nbins, plotTitle )
    % Gaussian MLE Fit - Fits 1 and 2 gaussians to a distribution
    % Input the data, the domain where you want to plot the results 
    % [xmin , xmax ] , and finally the nbins for the histogram
   
    domain = [0 ,max(data)];
    x = domain(1):domain(2);
    
    custpdf1= @(data, mu1 , sigma1) normpdf( data , mu1 , sigma1);
    custpdf2= @(data, mu1 , mu2 , sigma1 , sigma2) normpdf(data , mu1 , sigma1)+ normpdf(data , mu2 , sigma2);
    custpdf3= @(data, mu1 , mu2 , mu3 , sigma1 , sigma2 , sigma3) ...
        normpdf(data , mu1 , sigma1)+ normpdf(data , mu2 , sigma2)+ normpdf(data , mu3 , sigma3);
    custpdf4= @(data, mu1, mu2, mu3, mu4, sigma1, sigma2, sigma3, sigma4) ...
        normpdf(data , mu1 , sigma1)+ normpdf(data , mu2 , sigma2)+ normpdf(data , mu3 , sigma3) ...
        +normpdf(data , mu4, sigma4);
    custpdf5= @(data, mu1, mu2, mu3, mu4, mu5, sigma1, sigma2, sigma3, sigma4, sigma5) ...
        normpdf(data , mu1 , sigma1)+ normpdf(data , mu2 , sigma2)+ normpdf(data , mu3 , sigma3) ...
        +normpdf(data , mu4, sigma4)+normpdf(data , mu5, sigma5);
    
    muStart2 = quantile( data, 1/3*(1:2) );
    sigmaStart = sqrt( var(data) - .25*diff(muStart2).^2 );
    muStart3 = quantile( data, 1/4*(1:3) );
    muStart4 = quantile( data, 1/5*(1:4) );
    muStart5 = quantile( data, 1/6*(1:5) );

    start1= [ max(data)/4, max(data)/8 ];
    start2 = [ muStart2, sigmaStart, sigmaStart ];
    start3 = [ muStart3, sigmaStart, sigmaStart, sigmaStart ];
    start4 = [ muStart4, sigmaStart, sigmaStart, sigmaStart, sigmaStart ];
    start5 = [ muStart5, sigmaStart, sigmaStart, sigmaStart, sigmaStart, sigmaStart ];
    
    lb1 = [ -Inf, 0];
    ub1 = [ Inf, Inf];
    lb2 = [ -Inf, -Inf, 0,  0 ];
    ub2 = [ Inf, Inf, Inf, Inf ];
    lb3 = [ -Inf, -Inf, -Inf, 0, 0, 0 ];
    ub3 = [ Inf, Inf, Inf, Inf, Inf, Inf ];
    lb4 = [ -Inf, -Inf, -Inf, -Inf, 0, 0, 0 , 0];
    ub4 = [ Inf, Inf, Inf, Inf, Inf, Inf, Inf, Inf];
    lb5 = [ -Inf, -Inf, -Inf, -Inf, -Inf, 0, 0, 0, 0 , 0];
    ub5 = [ Inf, Inf, Inf, Inf, Inf, Inf, Inf, Inf, Inf, Inf];
    
    options = statset('MaxIter' , 1e4 , 'MaxFunEvals' , 2e4);
    
    phat1 = mle( data, 'pdf', custpdf1, 'start', start1, 'lower', lb1, ...
                  'upper', ub1, 'options', options);
    phat2 = mle( data, 'pdf', custpdf2, 'start', start2, 'lower', lb2, ...
                  'upper', ub2, 'options', options);
    phat3 = mle( data, 'pdf', custpdf3, 'start', start3, 'lower', lb3, ...
                  'upper', ub3, 'options', options);
    phat4 = mle( data, 'pdf', custpdf4, 'start', start4, 'lower', lb4, ...
                  'upper', ub4, 'options', options);
    phat5 = mle( data, 'pdf', custpdf5, 'start', start5, 'lower', lb5, ...
                  'upper', ub5, 'options', options);
    
    output.fitValues1 = phat1;
    output.fitValues2 = phat2;
    output.fitValues3 = phat3;
    output.fitValues4 = phat4;
    output.fitValues5 = phat5;
    
%     y1 = normpdf( x , phat1(1) , phat1(2) );
%     y2 = normpdf( x , phat2(1) , phat2(3))+ normpdf( x, phat2(2) , phat2(4));

    y31 = (1/3)*normpdf( x ,phat3(1), phat3(4));
    y32 = (1/3)*normpdf( x, phat3(2), phat3(5));
    y33 = (1/3)*normpdf( x, phat3(3), phat3(6));
    y3 = y31+y32+y33;
    
    y41 = (1/4)*normpdf( x, phat4(1), phat4(5));
    y42 = (1/4)*normpdf( x, phat4(2), phat4(6));
    y43 = (1/4)*normpdf( x, phat4(3), phat4(7));
    y44 = (1/4)*normpdf( x, phat4(4), phat4(8));
    y4 = y41+y42+y43+y44;
    
    y51 = (1/5)*normpdf( x, phat5(1), phat5(6));
    y52 = (1/5)*normpdf( x, phat5(2), phat5(7));
    y53 = (1/5)*normpdf( x, phat5(3), phat5(8));
    y54 = (1/5)*normpdf( x, phat5(4), phat5(9));
    y55 = (1/5)*normpdf( x, phat5(5), phat5(10));
    y5 = y51+y52+y53+y54+y55;
        
    scaleFactor = floor(max(data)/nbins)*length(data);
    
    % Plot for 3 gaussians
    figure;
    histogram( data , nbins );
    hold on
    plot( x , scaleFactor*y31 , 'LineWidth' , 2)
    plot( x , scaleFactor*y32 , 'LineWidth' , 2)  
    plot( x , scaleFactor*y33 , 'LineWidth' , 2)  
    plot( x , scaleFactor*y3 , 'LineWidth' , 2)  
    
    legend( 'Data', 'Gaussian One', 'Gaussian Two', 'Gaussians Three', ...
             'Sum of Gaussians');
    title( plotTitle)

    % Plot for 4 gaussians
    figure;
    histogram( data , nbins) ;

    hold on
    plot( x , scaleFactor*y41 , 'LineWidth' , 2)
    plot( x , scaleFactor*y42 , 'LineWidth' , 2)  
    plot( x , scaleFactor*y43 , 'LineWidth' , 2)  
    plot( x , scaleFactor*y44 , 'LineWidth' , 2)  
    plot( x , scaleFactor*y4 , 'LineWidth' , 2)  
    
    legend( 'Data', 'Gaussian One', 'Gaussian Two', 'Gaussian Three', ...
             'Gaussian Four', 'Sum of Gaussians');
    title( plotTitle)
    xlabel('StepSize')
    ylabel('Counts')
    
    % Plot for 5 gaussians
    
    figure;
    histogram( data , nbins) ;

    hold on
    plot( x , scaleFactor*y51 , 'LineWidth' , 2)
    plot( x , scaleFactor*y52 , 'LineWidth' , 2)  
    plot( x , scaleFactor*y53 , 'LineWidth' , 2)  
    plot( x , scaleFactor*y54 , 'LineWidth' , 2)  
    plot( x , scaleFactor*y55 , 'LineWidth' , 2)  
    plot( x , scaleFactor*y5 , 'LineWidth' , 2)  
    
    legend( 'Data', 'Gaussian One', 'Gaussian Two', 'Gaussian Three', ...
             'Gaussian Four', 'Gaussian Five', 'Sum of Gaussians')
    title( plotTitle)

    
end

