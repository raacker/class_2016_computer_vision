function hw_1()

x = imread('cameraman.tif');
s = size(x);
filter = 1/121 * ones(11,11);

result = filter2_revision(filter, x, 'zero')
result2 = filter2_revision(filter, x, 'mirror')
figure, 
subplot(1,3,1), imshow(x)
subplot(1,3,2), imshow(uint8(result))
subplot(1,3,3), imshow(uint8(result2))