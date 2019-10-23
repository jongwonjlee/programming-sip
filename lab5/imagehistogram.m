clear;
f = imread ('Fig0203(a).tif'); % Digital mammogram
figure(1);
subplot(3,2,1); imshow (f);
subplot(3,2,3); imhist(f);
h = imhist(f,25);
horz = linspace(0, 255, 25);
subplot(3,2,4); bar(horz, h)
axis([0 255 0 200000])
set(gca, 'xtick', 0:50:255, 'ytick', 0:50000:200000)
subplot(3,2,5); stem(horz, h)
axis([0 255 0 200000])
set(gca, 'xtick', 0:50:255, 'ytick', 0:50000:200000)
subplot(3,2,6); plot(horz, h)
axis([0 255 0 200000])
set(gca, 'xtick', 0:50:255, 'ytick', 0:50000:200000)