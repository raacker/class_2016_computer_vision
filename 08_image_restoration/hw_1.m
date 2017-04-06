function hw_1()

im = imread('twins.tif');
rgb = rgb2gray(im);
noised = imnoise(rgb, 'salt & pepper', 0.2);

filtered_three = median_filter(noised, [3,3]);
filtered_five = median_filter(noised, [5,5]);
built_filtered = medfilt2(noised, [5,5]);

figure,
subplot(2,2,1), title('noised image'), imshow(uint8(noised))
subplot(2,2,2), title('filtered 3x3 image'), imshow(uint8(filtered_three))
subplot(2,2,3), title('filtered 5x5 image'), imshow(uint8(filtered_five))
subplot(2,2,4), title('median built-in'), imshow(uint8(built_filtered))