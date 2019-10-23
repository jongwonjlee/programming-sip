clear;
g = imread ('Fig0203(a).tif'); % Digital mammogram
figure(1);
imshow(g,[]);

figure(2);
G = fftshift(fft2(g));
G_max = max(max(abs(G)));
subplot(1,3,1); imshow(abs(G)/G_max*255);

% Create a logical image of a circle with specified
% diameter, center, and image size.
% First create the image.
[imageSizeY, imageSizeX] = size(g);
[columnsInImage, rowsInImage] = meshgrid(1:imageSizeX, 1:imageSizeY);
% Next create the circle in the image.
centerX = floor(imageSizeX/2);
centerY = floor(imageSizeY/2);
radius = floor(imageSizeX/4);
circlePixels = (rowsInImage - centerY).^2 ...
    + (columnsInImage - centerX).^2 <= radius.^2;
subplot(1,3,2); imshow(circlePixels) ;

% G_lowpass = G(circlePixels);
% G_lowpass_max = max(max(abs(G_lowpass)));
% subplot(1,3,3); imshow(abs(G_lowpass)/G_lowpass_max*255,[]);

G_lowpass = G(circlePixels);

g_recon = ifft2(fft2(G));
subplot(1,3,3); imshow(g_recon,[]);

% G_log = mat2gray(log(1 + double(abs(G))));
% subplot(1,3,3); imshow(G_log);
