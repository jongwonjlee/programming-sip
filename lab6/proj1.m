clear;
close all;
f = imread ('blurry-moon.tif');
f = im2double(f);

figure(1);
subplot(3,2,1); imshow(f, [0 1]); title('original');
w8 = [1 1 1 ; 1 -8 1 ; 1 1 1];
g = imfilter(f,w8, 'replicate');
subplot(3,2,2); imshow(f-g, [0 1]);title('w8');

w5 = GenerateLaplacian(5);
g5 = imfilter(f,w5, 'replicate');
subplot(3,2,3); imshow(f-g5, [0 1]); title('n = 5');
w9 = GenerateLaplacian(9);
g9 = imfilter(f,w9, 'replicate');
subplot(3,2,4); imshow(f-g9, [0 1]); title('n = 9');
w15 = GenerateLaplacian(15);
g15 = imfilter(f,w15, 'replicate');
subplot(3,2,5); imshow(f-g15, [0 1]); title('n = 15');
w25 = GenerateLaplacian(25);
g25 = imfilter(f,w25, 'replicate');
subplot(3,2,6); imshow(f-g25, [0 1]); title('n = 25');