function y = stucki_diffusion(filename)
fid = fopen(filename);
if fid == -1
    error('잘못된 입력값!');
end;

x = imread(filename);

height = size(x,1);
width = size(x,2);
y = uint8(zeros(height, width));
z = zeros(height+4, width+4);
z(3:height+2, 3:width+2)=x;
for i = 3 : height+2,
    for j = 3 : width+2,
        if z(i,j) < 128
            y(i-1,j-1) = 0;
            e = z(i,j);
        else
            y(i-1,j-1) = 255;
            e = z(i,j)-255;
        end
        z(i,j+1)=z(i,j+1)+8*e/42;
        z(i,j+2)=z(i,j+2)+4*e/42;
        z(i+1,j-2)=z(i+1,j-2)+2*e/42;
        z(i+1,j-1)=z(i+1,j-1)+4*e/42;
        z(i+1,j)=z(i+1,j)+8*e/42;
        z(i+1,j+1)=z(i+1,j+1)+4*e/42;
        z(i+1,j+2)=z(i+1,j+2)+2*e/42;
        z(i+2,j-2)=z(i+2,j-2)+e/42;
        z(i+2,j-1)=z(i+2,j-1)+2*e/42;
        z(i+2,j)=z(i+2,j)+4*e/42;
        z(i+2,j+1)=z(i+2,j+1)+2*e/42;
        z(i+2,j+2)=z(i+2,j+2)+e/42;
    end
end

figure('Name','Stucki Algorithm'), imshow(uint8(y));