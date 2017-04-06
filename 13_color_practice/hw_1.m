function hw_1()

im = imread('twins.tif');
xn = imnoise(im, 'gaussian');

r_filter = wiener2(xn(:,:,1), [3,3]);
g_filter = wiener2(xn(:,:,2), [3,3]);
b_filter = wiener2(xn(:,:,3), [3,3]);
result = cat(3, r_filter, g_filter, b_filter);

r_filter2 = wiener2(xn(:,:,1), [5,5]);
g_filter2 = wiener2(xn(:,:,2), [5,5]);
b_filter2 = wiener2(xn(:,:,3), [5,5]);
result2 = cat(3, r_filter2, g_filter2, b_filter2);

r_filter3 = wiener2(xn(:,:,1), [7,7]);
g_filter3 = wiener2(xn(:,:,2), [7,7]);
b_filter3 = wiener2(xn(:,:,3), [7,7]);
result3 = cat(3, r_filter3, g_filter3, b_filter3);

figure,
subplot(2,2,1), imshow(uint8(xn)), title('gaussian noised')
subplot(2,2,2), imshow(uint8(result)), title('wiener filtered[3x3]')
subplot(2,2,3), imshow(uint8(result2)), title('wiener filtered[5x5]')
subplot(2,2,4), imshow(uint8(result3)), title('wiener filtered[7x7]')