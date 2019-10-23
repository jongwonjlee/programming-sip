clear; close all;
f = imread('redrose2.jpg');
figure(1); imshow(f);
mask = roipoly(f); % select polygon region, then double-click to finish (returns a logical array size of the original image.)
red = immultiply(mask, f(:,:,1));
green = immultiply(mask, f(:,:,2));
blue = immultiply(mask, f(:,:,3));
g = cat(3, red, green, blue);
figure(2); imshow(g); % show RGB image of ROI only
[M, N, K] = size(g);
idx = find(mask); % index of ROI array
I = reshape(g, M*N, 3);
I = double(I(idx, 1:3)); % only pixels of ROI
[C, m] = covmatrix(I);
d = diag(C);
sd = sqrt(d);
E = colorseg('mahalanobis', f, 50, m, C); %'euclidean' T = 12.5, 25, 37.5, 50
figure(3);
imshow(E);

mask_world = logical(E);
h_red = immultiply(mask_world, f(:,:,1));
h_green = immultiply(mask_world, f(:,:,2));
h_blue = immultiply(mask_world, f(:,:,3));
h = cat(3, h_red, h_green, h_blue);
figure(4);
imshow(h);

k_red = immultiply(~mask_world, f(:,:,1));
k_green = immultiply(~mask_world, f(:,:,2));
k_blue = immultiply(~mask_world, f(:,:,3));
k = cat(3, k_red, k_green, k_blue);
I = rgb2gray(k);
I = cat(3,I,I,I);
figure(5);
imshow(I);

figure(6);
imshow(h+I);




% clear; close all;
% f = imread('redrose2.jpg');
% [M,N,C] = size(f);
% 
% %% 3-1
% figure(1);
% imshow(f);
% 
% %% 3-2
% mask = roipoly(f);
% 
% r = immultiply(mask,f(:,:,1));
% g = immultiply(mask,f(:,:,2));
% b = immultiply(mask,f(:,:,3));
% 
% f_roi = cat(3,r,g,b);
% 
% figure(2);
% imshow(f_roi);
% 
% 
% %% 3-3
% idx = find(mask);
% I = reshape(f,M*N,3);
% I = double(I(idx,:));
% 
% [C,m] = covmatrix(I);
% 
% E25 = imbinarize(colorseg('mahalanobis', f, 50, m, C));
% 
% figure(3);
% imshow(E25);
% 
% %% 3-4
% r = immultiply(E25,f(:,:,1));
% g = immultiply(E25,f(:,:,2));
% b = immultiply(E25,f(:,:,3));
% 
% f_extracted = cat(3,r,g,b);
% 
% figure(4);
% imshow(f_extracted);
% 
% %% 3-5
% f_bg = rgb2gray(f);
% f_bg = immultiply(~E25, f_bg);
% f_bg = cat(3,f_bg,f_bg,f_bg);
% figure(5);
% imshow(f_bg);
% 
% %% 3-6
% 
% figure(6);
% imshow(f_bg+f_extracted);