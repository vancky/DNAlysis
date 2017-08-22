function [ output ] = BrownianMotion( input )
    %BROWNIAN M Summary of this function goes here
    %   Detailed explanation goes here


    R = 8.314;          % Universal gas constant [J K-1 mol-1]
    T = 293;            % temperature in degrees Kelvin [K]
    eta = 1.002e-3;     % dynamic viscosity [kg m-1 s-1]
    r = 5e-9;           % radius in [m]
    N = 6.022e23;       % Avogadros number (mol-1)
    t = 1.00;           % exposure time in seconds

    x2avg = R*T*t/(3*pi*eta*r*N); 
    xtravel = sqrt(x2avg);
    xpix = xtravel / (config.pixelSize);

end

