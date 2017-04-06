function exercise10(im, title_name)

detect1 = edge(im, 'Roberts');
detect2 = edge(im, 'Prewitt');
detect3 = edge(im, 'Sobel');

l = fspecial('laplacian', 0);

detect4 = mat2gray(filter2(l, im));

detect5 = edge(im, 'zerocross', l);

detect6 = edge(im, 'log');
detect7 = edge(im, 'Canny');


fh = figure,
subplot(3,3,1), imshow(detect1), title('Roberts')
subplot(3,3,2), imshow(detect2), title('Prewitt')
subplot(3,3,3), imshow(detect3), title('Sobel')
subplot(3,3,4), imshow(detect4), title('Laplacian')
subplot(3,3,5), imshow(detect5), title('Zerocross of laplacian')
subplot(3,3,6), imshow(detect6), title('Marr-Hildreth')
subplot(3,3,7), imshow(detect7), title('Canny');

set(fh, 'Name', title_name);