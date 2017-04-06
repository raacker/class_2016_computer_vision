function hw_1()

im = imread('cameraman.tif');

resize_nearest = up_sampling(im, 2.7, 'nearest');
resize_bilinear = up_sampling(im, 2.7, 'bilinear');
resize_bicubic = up_sampling(im, 2.7, 'bicubic');

figure, imshow(im), title('Original image');
figure, imshow(uint8(resize_nearest)), title('nearest resize');
figure, imshow(uint8(resize_bilinear)), title('bilinear resize');
figure, imshow(uint8(resize_bicubic)), title('bicubic resize');

near = imresize(im, 2.7, 'nearest');
bilin = imresize(im, 2.7, 'bilinear');
bicub = imresize(im, 2.7, 'bicubic');

figure, imshow(near), title('imresize() nearest');
figure, imshow(bilin), title('imresize() bilinear');
figure, imshow(bicub), title('imresize() bicubic');