function gray_dither()

intense_50 = 50 * ones(256);
intense_100 = 100 * ones(256);
intense_150 = 150 * ones(256);
intense_200 = 200 * ones(256);

uint8_50 = uint8(intense_50);
uint8_100 = uint8(intense_100);
uint8_150 = uint8(intense_150);
uint8_200 = uint8(intense_200);

D = [51,151;201,101];
r = repmat(D, 128, 128);
uint8_50 = uint8_50>r;
uint8_100 = uint8_100>r;
uint8_150 = uint8_150>r;
uint8_200 = uint8_200>r;

figure,
subplot(2,2,1), imshow(uint8_50), title('intense 50')
subplot(2,2,2), imshow(uint8_100), title('intense 100')
subplot(2,2,3), imshow(uint8_150), title('intense 150')
subplot(2,2,4), imshow(uint8_200), title('intense 200')