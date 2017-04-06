function output = imrotate_func(im, angle, method)

s = size(im);
rh = round(sqrt(s(1)^2 + s(2)^2));
rw = round(sqrt(s(1)^2 + s(2)^2));
radian = pi/180*angle;
output = zeros(rh, rw);

for i=1:rh
    for j=1:rw
        x = (i-rh/2)*cos(radian) + (j-rw/2)*sin(radian) + s(2)/2;
        y = -(i-rh/2)*sin(radian) + (j-rw/2)*cos(radian) + s(1)/2;
        if x <= s(1) && y<=s(2)
            if strcmp(method, 'nearest')
                ni = round(x);
                nj = round(y);
                if ni>=1 && nj>=1 && ni<=256 && nj<=256 
                    output(i,j) = im(ni, nj);
                end
            elseif strcmp(method, 'bilinear')
                    x1 = floor(x);
                    y1 = floor(y);
                    x2 = ceil(x);
                    y2 = ceil(y);
                    w = x-x1;
                    h = y-y1;
                if x1>=1  && y1>=1 && x2<=256 && y2<=256
                    output(i,j) = (1-w)*(1-h)*im(x1,y1) + w*(1-h)*im(x2,y1) + (1-w)*h*im(x1,y2) + w*h*im(x2,y2);
                end
            elseif strcmp(method, 'bicubic')
                temp = [im(2:-1:1,:); im; im(end:-1:end-(2-1), :)];
                temp = [temp(:, 2:-1:1), temp,temp(:, end:-1:end-(2-1))];
               
                x2 = floor(x); y2 = floor(y);
                x3 = ceil(x);  y3 = ceil(y);
                x1 = x2 - 1;   x4 = x3 + 1;
                y1 = y2 - 1;   y4 = y3 + 1;
                
                w = (x)-x2;
                h = (y)-y2;
                
                if x1>=1  && y1>=1 && x2<=256 && y2<=256
                    z1 = r3(-1-h)*(r3(-1-w)*temp(x1,y1)+r3(-w)*temp(x2,y1)+r3(1-w)*temp(x3,y1)+r3(2-w)*temp(x4,y1));
                    z2 = r3(-h)*(r3(-1-w)*temp(x1,y2)+r3(-w)*temp(x2,y2)+r3(1-w)*temp(x3,y2)+r3(2-w)*temp(x4,y2));
                    z3 = r3(1-h)*(r3(-1-w)*temp(x1,y3)+r3(-w)*temp(x2,y3)+r3(1-w)*temp(x3,y3)+r3(2-w)*temp(x4,y3));
                    z4 = r3(2-h)*(r3(-1-w)*temp(x1,y4)+r3(-w)*temp(x2,y4)+r3(1-w)*temp(x3,y4)+r3(2-w)*temp(x4,y4));
                    output(i,j) = z1 + z2 + z3 + z4;
                end
            end
        end
    end
end

end