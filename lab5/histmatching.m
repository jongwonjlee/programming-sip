clear;
f = imread ('Fig0210(a).tif'); % Mars moon
figure(1);
%% Show image and histogram
subplot(4,2,1); imshow(f);
subplot(4,2,2); imhist(f);
ylim([0 5e4])
%% Histogram Equalization
f1 = histeq(f, 256);
subplot(4,2,3); imshow(f1);
subplot(4,2,4); imhist(f1);
ylim([0 5e4])
%% Histogram Matching
p = twomodegauss(0.15, 0.05, 0.75, 0.05, 1, 0.07, 0.002);
g = histeq(f, p);
subplot(4,2,5); imshow(g);
subplot(4,2,6); imhist(g);
ylim([0 5e4])
%% Adaptive Histogram Equalization
g3 = adapthisteq(f, 'NumTiles', [25 25], 'ClipLimit', 0.05);
subplot(4,2,7); imshow(g3);
subplot(4,2,8); imhist(g3);
ylim([0 5e4])
%figure(2), plot(p);

function p = twomodegauss(m1, sig1, m2, sig2, A1, A2, k)
c1 = A1 * (1 / ((2 * pi)^0.5)*sig1);
k1 = 2 * (sig1^2);
c2 = A2 * (1 / ((2 * pi)^0.5)*sig2);
k2 = 2 * (sig2^2);
z = linspace(0, 1, 256);
p = k + c1 * exp(-((z-m1).^2) ./ k1) + ...
c2 * exp(-((z-m2).^2) ./ k2);
p = p ./ sum(p(:));
end