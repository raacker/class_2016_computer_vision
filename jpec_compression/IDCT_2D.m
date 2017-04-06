function result = IDCT_2D(im)

im_size = size(im);
result = zeros(im_size(1), im_size(2));

for i=1:im_size(2)
    temp = im(:,i);
    result(:,i) = IDCT_1D(temp');
end

for i=1:im_size(1)
    temp = result(i,:);
    result(i,:) = IDCT_1D(temp);
end