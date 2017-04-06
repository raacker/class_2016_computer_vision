function hw_2()

im = imread('cameraman.tif');

rotation_nearest = imrotate_func(im, 30, 'nearest');
rotation_bilinear = imrotate_func(im, 30, 'bilinear');
rotation_bicubic = imrotate_func(im, 30, 'bicubic');

figure, imshow(im), title('Original image');
figure, imshow(uint8(rotation_nearest)), title('nearest rotation');
figure, imshow(uint8(rotation_bilinear)), title('bilinear rotation');
figure, imshow(uint8(rotation_bicubic)), title('bicubic rotation');