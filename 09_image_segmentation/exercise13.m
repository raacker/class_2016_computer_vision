function exercise13()

im = imread('cameraman.tif');
im1 = imnoise(im, 'salt & pepper', 0.1);
im2 = imnoise(im, 'gaussian', 0, 0.02);

exercise10(im, 'original image')
exercise10(im1, 'Salt & pepper noise')
exercise10(im2, 'gaussian noise')