N1 = 17; K=3;
n = 0:N1-1;
x = exp(-n/4).*sin(2*pi*n/5); %sample signal
X = fft(x);

% y = zeros(1,N1*(K+1));
% y(n*(K+1)+1) = x; % re-sampled signal with K = 3. K means zero data.
y = [x; zeros(K,N1)];
y = reshape(y,1,(K+1)*N1);


Y = fft(y);
Y2 = [Y(1:(N1+1)/2), zeros(1,K*N1), Y((N1+1)/2+1:N1)];
y2 = (K+1)*ifft(Y2);

% figure(1);
% subplot(3,2,1); % plot original signal
% plot(x, 'o'); grid on; title('Original signal; N1=17');
% ylabel('x_n'); xlabel('n'); xlim([1 N1]);
% subplot(3,2,3); % plot signal with zero extension
% plot(y, 'o'); grid on; title('signal with zero insertion; N1=17, K=3');
% hold on; plot(n*(K+1)+1, x, 'ro');
% ylabel('y_n'); xlabel('n'); xlim([1 N1*(K+1)]);
% subplot(3,2,5);
% plot(y2, 'o'); grid on; title('Signal interpolation');
% ylabel('y2_n'); xlabel('n'); xlim([1 N1*(K+1)]);
% subplot(3,2,2);
% plot(-(N1-1)/2:(N1-1)/2, abs(fftshift(X)), '.-'); grid on; title('Amplitude spectra; N=17');
% ylabel('DFT amplitude'); xlabel('Frequency (m)');
% subplot(3,2,4);
% plot(-(N1*(K+1)-1)/2:(N1*(K+1)-1)/2, abs(fftshift(Y)), '.-'); grid on;
% title('Amplitude spectra; N=17, K=2');
% ylabel('DFT amplitude'); xlabel('Frequency (m)');
% subplot(3,2,6);
% plot(-(N1*(K+1)-1)/2:(N1*(K+1)-1)/2, abs(fftshift(Y2)), '.-'); grid on;
% title('Amplitude spectra; N=17, K=2');
% ylabel('DFT amplitude'); xlabel('Frequency (m)');

figure(1);
subplot(2,1,1); % plot original signal
plot(x, 'o'); grid on; title('Original signal; N1=17');
ylabel('x_n'); xlabel('n'); xlim([1 N1]);
subplot(2,1,2);
plot(y2, 'o'); grid on; title('Signal interpolation');
ylabel('y2_n'); xlabel('n'); xlim([1 N1*(K+1)]);