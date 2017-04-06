function four4dither(filename)
fid = fopen(filename);
if fid == -1
    error('잘못된 입력값!');
end;

x = imread(filename);

D = [0,128,32,160; 192,64,224,96 48,176,16,144;240,112,208,80];
r = repmat(D, 64, 64);
x = double(x);
q = floor(x/85);
x4 = q +(x-85*q>4);
figure, imshow(uint8(x4*85));