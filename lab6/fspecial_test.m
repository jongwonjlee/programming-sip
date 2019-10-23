clear;
close all; 

f = imread ('FigP0304.tif');
figure(1);
subplot(2,2,1); imshow(f);
w = fspecial('average', [3 3]);
g = imfilter(f,w);
subplot(2,2,2); imshow(g);
w2 = fspecial('average', [11 11]);
g2 = imfilter(f,w2);
subplot(2,2,3); imshow(g2);
w3 = fspecial('average', [21 21]);
g3 = imfilter(f,w3);
subplot(2,2,4); imshow(g3);

w4 = fspecial('gaussian', [21 21], 3.5);
g4 = imfilter(f,w4);
figure(2);
subplot(1,2,1); imshow(g4);
w5 = fspecial('gaussian', [21 21], 7);
g5 = imfilter(f,w5);
subplot(1,2,2); imshow(g5);