function hw_2()

im = imread('cameraman.tif');

filter_x = dim1_gaussian(5, 2);
filter_o = filter2(filter_x, im);

filter_result = filter2(filter_x', filter_o);

figure, 
subplot(1,2,1), imshow(uint8(filter_result))
subplot(1,2,2), imshow(uint8(filter2(fspecial('gaussian', 5, 2), im)))