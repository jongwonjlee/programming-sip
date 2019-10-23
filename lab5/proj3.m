clear;
close all;

%% question a
f = imread('FigP0304.tif');
figure(1);
subplot(4,2,1); imshow(f);
subplot(4,2,2); imhist(f);
ylim('auto');

%% question b
g1 = imadjust(f, [0 0.1], [ ]);
subplot(4,2,3); imshow(g1);
subplot(4,2,4); imhist(g1);


%% question c
g2 = histeq(f);
subplot(4,2,5); imshow(g2);
subplot(4,2,6); imhist(g2);


%% question d
g3 = adapthisteq(f, 'NumTiles', [3 3], 'ClipLimit', 0.2);
subplot(4,2,7); imshow(g3);
subplot(4,2,8); imhist(g3);
