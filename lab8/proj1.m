clear;
f = imread ('RGB.jpg'); % Load fruits
figure(1)
subplot(3,3,1),imshow(f); % original image
[M,N,C] = size(f);
f_r = f(:,:,1);
f_g = f(:,:,2);
f_b = f(:,:,3);
subplot(3,3,4),imshow(f_r); % red component
subplot(3,3,5),imshow(f_g); % green component
subplot(3,3,6),imshow(f_b); % blue component
f_rg = f_r - f_g;
f_rb = f_r - f_b;
f_gb = f_g - f_b;
subplot(3,3,7), imshow(f_rg,[]); % red component in red color
subplot(3,3,8), imshow(f_rb,[]); % green component in green color
subplot(3,3,9), imshow(f_gb,[]); % blue component in blue color