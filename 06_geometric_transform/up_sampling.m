function scaled = up_sampling(im, factor, method)

im_size = size(im);
factored_x = ceil(im_size(1)*factor);
factored_y = ceil(im_size(2)*factor);
scaled = zeros(factored_x, factored_y);

if strcmp(method,'nearest')
    for i=1 : factored_x
        for j=1 : factored_y
            x_round = round(i/2.7);
            y_round = round(j/2.7);
            
            if x_round == 0
                x_round = 1;
            end
            if y_round == 0
                y_round = 1;
            end
            s = im(x_round, y_round);
            scaled(i,j) = s;
        end
    end
    
elseif strcmp(method, 'bilinear')
    scale_x = factored_x./(im_size(1)-1);
    scale_y = factored_y./(im_size(2)-1);
    for i = 0 : factored_x-1
        for j = 0 : factored_y-1
            W = -(((i./scale_x)-floor(i./scale_x))-1);
            H = -(((j./scale_y)-floor(j./scale_y))-1);
            I11 = im(1+floor(i./scale_x),1+floor(j./scale_y));
            I12 = im(1+ceil(i./scale_x),1+floor(j./scale_y));
            I21 = im(1+floor(i./scale_x),1+ceil(j./scale_y));
            I22 = im(1+ceil(i./scale_x),1+ceil(j./scale_y));
            scaled(i+1,j+1) = (1-W).*(1-H).*I22 + (W).*(1-H).*I21 + (1-W).*(H).*I12 + (W).*(H).*I11;
        end
    end
    
elseif strcmp(method, 'bicubic')
    temp = [im(2:-1:1,:); im; im(end:-1:end-(2-1), :)];
    temp = [temp(:, 2:-1:1), temp, temp(:, end:-1:end-(2-1))];
    
    for i = 3 : factored_x+2 
        x2 = floor(i/factor);
        x3 = ceil(i/factor);
        x1 = x2 - 1; x4 = x3 + 1;
       
        if x1 == 0
            x1 = 1;
        end 
        
        W = (i/factor)-x2;
        
        for j = 3 : factored_y+2
            
            y2 = floor(j/factor);
            y3 = ceil(j/factor);
           
            y1 = y2 - 1; y4 = y3 + 1;
            
            if y1 == 0
                y1 = 1;
            end
            
            H = (j/factor)-y2;
            
            Y1 = r3(-1-H)*(r3(-1-W)*temp(x1,y1)+r3(-W)*temp(x2,y1)+r3(1-W)*temp(x3,y1)+r3(2-W)*temp(x4,y1));
            Y2 = r3(-H)*(r3(-1-W)*temp(x1,y2)+r3(-W)*temp(x2,y2)+r3(1-W)*temp(x3,y2)+r3(2-W)*temp(x4,y2));
            Y3 = r3(1-H)*(r3(-1-W)*temp(x1,y3)+r3(-W)*temp(x2,y3)+r3(1-W)*temp(x3,y3)+r3(2-W)*temp(x4,y3));
            Y4 = r3(2-H)*(r3(-1-W)*temp(x1,y4)+r3(-W)*temp(x2,y4)+r3(1-W)*temp(x3,y4)+r3(2-W)*temp(x4,y4));
            scaled(i-2,j-2) = round(Y1 + Y2 + Y3 + Y4);
        
        end
    end
else
    
end


