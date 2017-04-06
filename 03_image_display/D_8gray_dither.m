function D_8gray_dither(filename)
fid = fopen(filename);
if fid == -1
    error('잘못된 입력값!');
end;

x = imread(filename);

D = [0,24;36,12];
r = repmat(D, 128, 128);
x = double(x);
q = floor(x/37);
x4 = q +(x-37*q>r);
figure, imshow(uint8(x4*37));