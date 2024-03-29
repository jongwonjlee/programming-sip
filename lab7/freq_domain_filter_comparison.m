%% Comparision between two frequency domain filters, lpfilter and hand-made filter.

clear;
f = imread( 'testpattern512.tif'); % testpattern
f = im2single(f);

N = 512;
F = fft2(f, N*2, N*2); %% zero-padded image in freq domain


%% Step 1: hand-made filter [freq domain]
[U,V] = dftuv(N*2, N*2);
D = hypot(U, V); % euclidian distance; prepared for making guassian filter
D0 = 0.05*N*2;
man_filter = exp(-(D.^2)/(2*(D0^2)));
G = man_filter.*F;
g = ifft2(G);
g = g(1:N, 1:N);


%% Step 2: Using given function 'lpfilter' [freq domain]
given_filter = lpfilter('gaussian',1024,1024,D0);
H = given_filter.*F;
h = ifft2(H);
h = h(1:N,1:N);


%% Step 4: Apply filters and show results

H = given_filter.*F;
h = ifft2(H);
h = h(1:N,1:N);

figure(1);
subplot(2,3,1), imshow(D, []); title('D(u,v)');
subplot(2,3,2), imshow(man_filter, []); title('manual');
subplot(2,3,3), imshow(fftshift(man_filter), []); title('manual(shifted)');
subplot(2,3,5), imshow(given_filter, []); title('lpfilter');
subplot(2,3,6), imshow(fftshift(given_filter), []); title('lpfilter(shifted)');

figure(2);
subplot(2,2,1), imshow(f, []); title('before');
subplot(2,2,3), imshow(g, []); title('manual');
subplot(2,2,4), imshow(h, []); title('lpfilter');



function [U,V] = dftuv(M,N)
    %DFTUV Computes meshgrid frequency matrices.
    % SEt up range of variables.
    u = single(0:(M-1));
    v = single(0:(N-1));
    % Compute the indices for use in meshgrid.
    idx = find(u>M/2);
    u(idx) = u(idx) - M;
    idy = find(v>N/2);
    v(idy) = v(idy) - N;
    % Compute the meshgrid arrays.
    [U, V] = meshgrid(u,v);
end