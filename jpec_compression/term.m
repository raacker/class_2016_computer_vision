function term()

Q = [16,11,10,16,24,40,51,61;12,12,14,19,26,58,60,55;
    14,13,16,24,40,57,69,56;14,17,22,29,51,87,80,62;
    18,22,37,56,68,109,103,77;24,35,55,64,81,104,113,92;
    49,64,78,87,103,121,120,101;72,92,95,98,112,100,103,99];

%im = imread('Cameraman.bmp');
im = imread('Lena.bmp');
%im = imread('caribou.tif');

%im_name = 'Cameraman Compression Result';
im_name = 'Lena Compression Result';

im_size = size(im);

N = [1 2 3 5 10];
PSNR_value = zeros(1,5);
compress_value = zeros(1,5);
out_result = cell(1,5);

total_size = im_size(1) * im_size(2);

for i = 1 : 5
    [in, table, im_x, im_y] = jpeg_in(im, N(i), Q);
    out = jpeg_out(in, table, N(i), Q, im_x, im_y);
    out_result{1,i} = out;
    
    comp_size = size(in);
    comp_size = comp_size(2);
    
    compress_value(1,i) = round(100 - ((comp_size/total_size) * 100));
    PSNR_value(1,i) = psnr(im, out);
end

figure('Name', 'Compression Result'),
subplot(2,3,1), imshow(uint8(im)), title('Original Image')
subplot(2,3,2), imshow(uint8(out_result{1,1})), title('N = 1')
subplot(2,3,3), imshow(uint8(out_result{1,2})), title('N = 2')
subplot(2,3,4), imshow(uint8(out_result{1,3})), title('N = 3')
subplot(2,3,5), imshow(uint8(out_result{1,4})), title('N = 5')
subplot(2,3,6), imshow(uint8(out_result{1,5})), title('N = 10')

figure('Name', im_name),
subplot(1,2,1), plot( N, compress_value), 
title('Compress ratio'), xlabel('N ratio'), ylabel('Compress ratio')
subplot(1,2,2), plot( N, PSNR_value),
title('PSNR'), xlabel('N ratio'), ylabel('PSNR')


