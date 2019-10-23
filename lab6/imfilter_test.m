clear;
f = imread ('FigP0304.tif'); % Black-white pattern
f = im2double(f); % from 0~255 to 0~1
figure(1);
subplot(2,3,1); imshow(f);
ylim('auto')
w = ones(31);
gd = imfilter(f,w);
subplot(2,3,2); imshow(gd, []);
gr = imfilter(f,w, 'replicate');
subplot(2,3,3); imshow(gr, []);
gs = imfilter(f,w, 'symmetric');
subplot(2,3,4); imshow(gs, []);
gc = imfilter(f,w, 'circular');
subplot(2,3,5); imshow(gc, []);
f8 = im2uint8(f);
w = w./sum(w(:));
g8r = imfilter(f8,w, 'replicate');
subplot(2,3,6); imshow(g8r, []);