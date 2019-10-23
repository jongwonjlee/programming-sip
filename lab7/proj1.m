clear;
close all;

f = imread ('L7P-boy.tif');
f = im2single(f);
g = imread ('L7P-lena.tif');
g = im2single(g);

F = fft2(f);
G = fft2(g);
% Fc = fftshift(F);
% Gc = fftshift(G);
Fs = abs(F);
Gs = abs(G);
Fp = atan2(imag(F),real(F)); %% or, angle(F)
Gp = atan2(imag(G),real(G));

figure(1);
subplot(3,2,1); imshow(f,[]);
subplot(3,2,3); imshow(log(1+Fs),[]);
subplot(3,2,5); imshow(unwrap(Fp),[]);
subplot(3,2,2); imshow(g,[]);
subplot(3,2,4); imshow(log(1+Gs),[]);
subplot(3,2,6); imshow(unwrap(Gp),[]);

H = Fs.*exp(1i*Gp);
h = ifft2(H);
K = Gs.*exp(1i*Fp);
k = ifft2(K);

figure(2);
subplot(1,2,1); imshow(abs(h),[]);
subplot(1,2,2); imshow(abs(k),[]);

fp = ifft2(exp(1i*Fp));
gp = ifft2(exp(1i*Gp));

figure(3);
subplot(1,2,1); imshow(abs(fp),[]);
subplot(1,2,2); imshow(abs(gp),[]);
