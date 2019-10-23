clear;
f = imread ('text-dipxe-blurred.tif');
f = im2double(f);
figure(1);
subplot(3,2,1); imshow(f, [0 1]);
w = fspecial('gaussian', [31 31], 5.0);
gg = imfilter(f,w, 'symmetric');
subplot(3,2,3); imshow(gg, [0 1]);
f_mask = f-gg;
subplot(3,2,4); imshow(f_mask, [ ]);
f_unsharp1 = f + 1.0 * f_mask;
subplot(3,2,5); imshow(f_unsharp1, [0 1]);
f_unsharp2 = f + 4.5 * f_mask;
subplot(3,2,6); imshow(f_unsharp2, [0 1]);