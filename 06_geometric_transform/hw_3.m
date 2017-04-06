function hw_3()

im = imread('cameraman.tif');

im_first = up_sampling(im, 2.0, 'bilinear');
im_second = imresize(im_first, 0.5, 'bilinear');

im_third = imresize(im, 0.5, 'bilinear');
im_fourth = up_sampling(im_third, 2.0, 'bilinear');

figure, imshow(uint8(im)), title('original image');
figure, imshow(uint8(im_second)), title('up-scaled, and down-scaled image');

figure, imshow(uint8(im)), title('original image');
figure, imshow(uint8(im_fourth)), title('down-scaled and up-scaled image');

if im == im_secondn
    disp('first and second is same')
else
    disp('first and second is diff')
end

if im == im_fourth
    disp( 'third and fourth is same')
else
    disp('third and fourth is diff')
end