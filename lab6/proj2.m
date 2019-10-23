clear;
close all;
f = imread ('FigP0305(a)(blurry_moon).tif');
f = im2double(f);
figure(1);
subplot(2,2,1); imshow(f, [0 1]); title('original');
w = fspecial('average');
f_mask = f - imfilter(f,w, 'symmetric');
subplot(2,2,2); imshow(f_mask, [0 1]); title('f mask');
f_sharpen = f + 1 * f_mask;
subplot(2,2,3); imshow(f_sharpen, [0 1]); title('sharpen image');

f_unsharpen = f - 1 * f_mask;
subplot(2,2,4); imshow(f_unsharpen, [0 1]); title('unsharpen image');