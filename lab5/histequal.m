clear;
f = imread ('Fig0208(a).tif'); % Digital mammogram
figure(1);
subplot(2,2,1); imshow (f);
subplot(2,2,2); imhist(f);
ylim('auto')
g = histeq(f, 256);
subplot(2,2,3); imshow (g);
subplot(2,2,4); imhist(g);
ylim('auto')

hnorm = imhist(f)./numel(f); % Normalized histogram
cdf = cumsum(hnorm); %Cumulative Distribution Function
x = linspace(0, 1, 256); %Intervals for [0, 1] horiz scale.
figure(2)
plot(x, cdf) %plot cdf
axis([0 1 0 1]); %scale
xlabel('Input intensity values', 'fontsize', 9)
ylabel('Output intensity values', 'fontsize', 9)
title('Transformation function', 'fontsize', 10)


gnorm = imhist(g)./numel(g); % Normalized histogram
cdf_g = cumsum(gnorm); %Cumulative Distribution Function
x = linspace(0, 1, 256); %Intervals for [0, 1] horiz scale.
figure(2)
plot(x, cdf_g) %plot cdf
axis([0 1 0 1]); %scale
xlabel('Input intensity values', 'fontsize', 9)
ylabel('Output intensity values', 'fontsize', 9)
title('Transformation function', 'fontsize', 10)