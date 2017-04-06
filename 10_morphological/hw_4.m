function hw_4()

im = imread('cameraman.tif');

b1 = [10,10,10;10,10,10;10,10,10];
b2 = [5,20,5;20,5,20;5,20,5];

im_dil_b1 = func_dilation_gray(im, b1);
im_dil_b2 = func_dilation_gray(im, b2);
im_ero_b1 = func_erosion_gray(im, b1);
im_ero_b2 = func_erosion_gray(im, b2);
im_open_b1 = func_opening_gray(im, b1);
im_open_b2 = func_opening_gray(im, b2);
im_close_b1 = func_closing_gray(im, b1);
im_close_b2 = func_closing_gray(im, b2);

figure('name','camenraman'),
subplot(2,4,1), imshow(im_dil_b1), title('cameraman dilation b1')
subplot(2,4,2), imshow(im_ero_b1), title('cameraman erosion b1')
subplot(2,4,3), imshow(im_open_b1), title('cameraman opening b1')
subplot(2,4,4), imshow(im_close_b1), title('cameraman closing b1')
subplot(2,4,5), imshow(im_dil_b2), title('cameraman dilation b2')
subplot(2,4,6), imshow(im_ero_b2), title('cameraman erosion b2')
subplot(2,4,7), imshow(im_open_b2), title('cameraman opening b2')
subplot(2,4,8), imshow(im_close_b2), title('cameraman closing b2')
end