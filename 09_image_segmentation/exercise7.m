function exercise7()

im = imread('circles.tif');
[x,y] = meshgrid(1:256, 1:256);
im2 = double(im).*((x+y)/2+64) + x + y;
im3 = uint8(256*mat2gray(im2));

thresh = @(param) im2bw(param, graythresh(param));

out1 = blkproc(im3, [32, 32], thresh);
out2 = blkproc(im3, [51, 51], thresh);
out3 = blkproc(im3, [64, 64], thresh);
out4 = blkproc(im3, [85, 85], thresh);
out5 = blkproc(im3, [128, 128], thresh);

figure,
subplot(2,3,1), imshow(out1), title('32x32')
subplot(2,3,2), imshow(out2), title('51x51')
subplot(2,3,3), imshow(out3), title('64x64')
subplot(2,3,4), imshow(out4), title('85x85')
subplot(2,3,5), imshow(out5), title('128x128')