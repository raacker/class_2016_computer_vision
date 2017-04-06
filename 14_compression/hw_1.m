function hw_1()

im = imread('cameraman.tif');

table = huffman_table(im);

tic
enc = huffman_encoding(im, table);
toc

tic
dec = huffman_decoding(enc, table);
toc

enc = uint8(enc);
dec = uint8(dec);

whos enc im dec

if im == dec
    disp('two image is totally same');
end

figure,
subplot(1,2,1), imshow(uint8(im))
subplot(1,2,2), imshow(uint8(dec))
