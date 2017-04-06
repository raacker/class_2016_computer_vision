function out = median_filter(im, filter)

im_size = size(im);
f_h = floor(filter(1)/2);
f_w = floor(filter(2)/2);

out = zeros((im_size(1) + f_h*2), (im_size(2) + f_w*2));
out(1+f_h:im_size(1)+f_h, 1+f_w:im_size(2)+f_w) = im;

temp = zeros(im_size);

for i=1 : im_size(1)
    for j=1 : im_size(2)
        window = out(i : 1 : 2*f_h+i , j : 1 : 2*f_w+j);
        temp(i,j) = get_median_value_from_selection_sort(window);
    end
end

out = temp;