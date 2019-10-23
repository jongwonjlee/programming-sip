clear;
f = imread ('neg2.jpg'); % Load fruits
figure(1)
subplot(3,3,1),imshow(f); % original image
[M,N,C] = size(f);
f_r = f(:,:,1);
f_g = f(:,:,2);
f_b = f(:,:,3);
subplot(3,3,4),imshow(f_r); % red component
subplot(3,3,5),imshow(f_g); % green component
subplot(3,3,6),imshow(f_b); % blue component
f_r_rev = 255-f(:,:,1);
f_g_rev = 255-f(:,:,2);
f_b_rev = 255-f(:,:,3);
f_rev = cat(3,f_r_rev,f_g_rev,f_b_rev);
subplot(3,3,7); imshow(f_rev,[]);

subplot(3,3,9); imshow(imcomplement(f),[]);


% clear; close all;
% f = imread('neg2.jpg');
% 
% figure(1);
% imshow(f);
% 
% r = f(:,:,1);
% g = f(:,:,2);
% b = f(:,:,3);
% 
% figure(2);
% subplot(1,3,1); imshow(r);
% subplot(1,3,2); imshow(g);
% subplot(1,3,3); imshow(b);
% 
% finv = 255-f;
% figure(3);
% imshow(finv);
% 
% 
% fcomp = imcomplement(f);
% figure(4);
% imshow(fcomp);