clear;
close all;

f = imread( 'L7P-car-moire-pattern.tif');

[M N] = size(f);
f = im2single(f);
F = fft2(f);
S = (log(1+abs(fftshift(F))));
figure(1);
subplot(1,4,1), imshow(f, []) % original
subplot(1,4,2), imshow(S, []) % spectrum
C1 = [40 56; 83 56; 166 58; 207 57];
H1 = cnotch('gaussian', 'reject', M, N, C1, 5);
P1 = gscale(fftshift(H1).*S);
subplot(1,4,3), imshow(P1)  % spectrum of cnotch
g1 = ifft2(H1.*F);
subplot(1,4,4), imshow(g1, [])  % spectrum of filtered image