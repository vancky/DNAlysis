figure
a=0; for i=1:100; a=a+importImages.image{i}; end
imshow(a,[])

figure
if 1
  
    
    [x,y] = meshgrid( 1:512, 1:512 );
    z = importImages.image{2}.*0; 
    for i=1:100
        z = z + importImages.image{i};
    end   
    z = double(z);
    z = z - mean(z(:)); 
    z = z / max(z(:));
    surf(x,y,z);
    shading interp;
end