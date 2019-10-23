clear;
close all;

%% answer that the instruction required
% w = fspecial('gaussian', [3 3], 1.0);
% w2 = imfilter(w,w,'full');
% w3 = imfilter(w2,w,'full');
% w4 = imfilter(w3,w,'full'); 
% w_gaussian = fspecial('gaussian', [9 9], 2.0);
% 
% figure(1); title('gaussian filter: comparison');
% subplot(2,1,1); mesh(w4);
% subplot(2,1,2); mesh(w_gaussian);
% 
% 
% f = imread('testpattern1024.tif');
% 
% g1 = imfilter(f, w4);
% g2 = imfilter(f,w_gaussian);
% 
% figure(2);
% subplot(1,3,1); imshow(f); title('original');
% subplot(1,3,2); imshow(g1); title('gaussian x 4');
% subplot(1,3,3); imshow(g2); title('gaussian with same size');
% 
% 


%% the result below is same as the out; the most desired case
w = fspecial('gaussian', [9 9], 1.0);
w2 = imfilter(w,w,'full');
w3 = imfilter(w2,w,'full');
w4 = imfilter(w3,w,'full'); 
w_comp = fspecial('gaussian', [33 33], 2.0);

figure(1);
subplot(2,1,1); mesh(w4);
subplot(2,1,2); mesh(w_comp);

f = imread('testpattern1024.tif');

g1 = f;
for i=1:4
    g1 = imfilter(g1,w);
end

g2 = imfilter(f,w_comp);

figure(2);
subplot(1,3,1); imshow(f); title('original');
subplot(1,3,2); imshow(g1); title('gaussian x 4');
subplot(1,3,3); imshow(g2); title('gaussian with same size');
