function [ mirrorImage ] = MirrorImage( image, size, mirrorLength )
    % Mirror a square image- (the function can be extended easily to rectangular)
    % builds a mirrorImage by rotating/flipping edges of the image
    % size is the size of the original image
    % mirrorLength is the length of the mirroring
    
     s =size; %512
     mL=mirrorLength; %12
    
  
     mirrorImage(1:mL,1:mL)=rot90(image(1:mL,1:mL),2); %topleft corner
     mirrorImage(s+mL+1:s+2*mL,1:mL)=rot90(image(s-mL+1:s,1:mL),2); %bottom left corner
     mirrorImage(1:mL,s+mL+1:s+2*mL)=rot90(image(1:mL,s-mL+1:s),2); %top right corner
     mirrorImage(s+mL+1:s+2*mL,s+mL+1:s+2*mL)=rot90(image(s-mL+1:s,s-mL+1:s),2);  %bottom right corner
     mirrorImage(mL+1:s+mL,1:mL)=fliplr(image(:,1:mL));   %left side
     mirrorImage(mL+1:s+mL,s+mL+1:s+2*mL)=fliplr(image(:,s-mL+1:s));   %right side
     mirrorImage(1:mL,mL+1:s+mL)=flipud(image(1:mL,:));        % top side
     mirrorImage(s+mL+1:s+2*mL,mL+1:s+mL)=flipud(image(s-mL+1:s,:));  %bottom side
     mirrorImage(mL+1:s+mL,mL+1:s+mL)=image;
end

