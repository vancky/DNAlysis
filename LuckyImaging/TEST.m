a=0; for i=1:30; a=a+clean{i}.imageGaussian; end
imshow(a,[])


if 0
    close all
    
    [x,y] = meshgrid( 1:512, 1:512 );
    z = stackImages.image{2}.*0; 
    for i=1:30
        z = z + stackImages.image{i};
    end   
    z = double(z);
    z = z - mean(z(:)); 
    z = z / max(z(:));
    surf(x,y,z);
    shading interp;
end