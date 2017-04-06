function hw_5()

im = imread('cameraman.tif');

filter_x = dim1_gaussian(7, 0.5);
filter_o = filter2(filter_x, im);

filter_result = filter2(filter_x', filter_o);

figure, imshow(uint8(filter2(unsharp_filter(), filter_result)))
