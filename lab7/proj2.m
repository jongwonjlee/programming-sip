clear;
close all;


D0 = 50; % cutoff frequency = 50
n = 4; % order of butterworth filter

f = imread ('L7P-thumb-print.tif');

[M, N] = size(f);
f = im2single(f);

[U,V] = dftuv(M*2, N*2);
D = hypot(U, V);
F = fft2(f, M*2, N*2);
H = 1./(1+(D0./D).^(2*n));
% H = hpfilter('btw', M*2, N*2, D0, n);
G = H.*F;
g = ifft2(G);
g1 = g(1:M, 1:N);

figure(1);

subplot(3,2,1), imshow(f, []); title('Original'); % original
subplot(3,2,3), imshow(fftshift(log(1+abs(F))), []); title('Before applying H-filter'); % spectrum
subplot(3,2,4), imshow(fftshift(log(1+abs(G))), []); title('After applying H-filter'); % angle
subplot(3,2,5), imshow(g1, []); title('Enhanced'); % an enhanced image after applying the butterworth filter

g2 = mat2gray(g1);
subplot(3,2,6), imshow(g2,[0.05 1]); title('After applying thres'); %  g2(g2<0.75*max(g2(:)))= 0;

% figure(2);
% ghe(ghe<0.75*max(ghe(:)))= 0;
% ghe(ghe~=0) = 255;
% imshow(ghe);
