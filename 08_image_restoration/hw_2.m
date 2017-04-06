function hw_2()

im = imread('twins.tif');
gray = rgb2gray(im);
noised = imnoise(gray, 'gaussian', 0, 0.005);

[aver, out] = adaptive_filter(noised);
wiener_result = wiener2(noised, [7,7]);

figure,
subplot(2,2,1), title('average of image'), imshow(uint8(aver))
subplot(2,2,2), title('output of adaptive filter'), imshow(uint8(out))
subplot(2,2,3), title('wiener2 output'), imshow(wiener_result)