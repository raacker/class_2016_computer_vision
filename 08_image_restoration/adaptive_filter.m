function [aver_result,out] = adaptive_filter(im)

im_size = size(im);

filter = [7,7];

f_h = floor(filter(1)/2);
f_w = floor(filter(2)/2);

out = zeros((im_size(1) + f_h*2), (im_size(2) + f_w*2));
out(1+f_h:im_size(1)+f_h, 1+f_w:im_size(2)+f_w) = im;

temp = zeros(im_size);
dist = zeros(im_size);
aver = zeros(im_size);

for i=1 : im_size(1)
    for j=1 : im_size(2)
        window = out(i : 1 : 2*f_h+i , j : 1 : 2*f_w+j);
        aver(i,j) = mean(mean(window));
        window_quad = window.^2;
        aver_quad = aver(i,j)^2;
        
        quad_sum = sum(sum(window_quad));
        quad_aver = quad_sum/(filter(1) * filter(2));
        dist(i,j) = quad_aver - aver_quad;
    end
end

n = mean(mean(dist));

for i=1 : im_size(1)
    for j=1 : im_size(2)
        temp(i,j) = aver(i,j) + ((max(0, (dist(i,j)-n)) / max(dist(i,j) , n))) * (im(i,j) - aver(i,j));
    end
end

aver_result = aver;
out = temp;


