function [ output ] = SurfColor( inputImage )
    % SurfColor - Creates a surface plot with a colormap and nice shading
    
    figure;
    surf( inputImage);
    colormap hot;
    shading interp;
end

