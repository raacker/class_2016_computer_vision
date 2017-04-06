function hw_2()

im = imread('twins.tif');
ty = rgb2ntsc(im);
tn = imnoise(ty(:,:,1), 'salt & pepper');

r_filter = imnoise(im(:,:,1), 'salt & pepper');
g_filter = imnoise(im(:,:,2), 'salt & pepper');
b_filter = imnoise(im(:,:,3), 'salt & pepper');

ty(:,:,1) = tn;

med_filter = medfilt2(tn, [5,5]);

med_r_filter = medfilt2(r_filter, [5,5]);
med_g_filter = medfilt2(g_filter, [5,5]);
med_b_filter = medfilt2(b_filter, [5,5]);

r_Y_result = ntsc2rgb(ty);

ty(:,:,1) = med_filter;
med_Y_result = ntsc2rgb(ty);

all3_result = cat(3, r_filter, g_filter, b_filter);
med3_result = cat(3, med_r_filter, med_g_filter, med_b_filter);

figure,
subplot(2,2,1), imshow(r_Y_result), title('noised Luminance')
subplot(2,2,2), imshow(all3_result), title('noised all segment')
subplot(2,2,3), imshow(med_Y_result), title('filtered luminance')
subplot(2,2,4), imshow(med3_result), title('filtered all segment')