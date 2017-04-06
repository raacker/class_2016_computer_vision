t=zeros(512,512);
for i=1:512
	for j=1:512
		t(i,j)=((124.5)^2<(i-256).^2+(j-256).^2)&((i-256).^2+(j-256).^2<(125.5)^2);
	end
end
t=~t;

image = t*255;

h=fspecial('gaussian');

out=imfilter(image, h);

imshow(uint8(out));
tr=imresize(out,0.5, 'nearest');
trc=imresize(out,0.5,'bicubic');

figure, imshow(uint8(tr));
figure, imshow(uint8(trc));