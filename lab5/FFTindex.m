fs = 100; % sampling frequency
T = 1/fs; % sampling interval
tmax = 2; % play time
t = T:T:tmax; % sample points
N = fs * tmax; % total number of samples
f1 = 5; % frequency of the signal
y = sin (2 * pi * f1 * t); % generating sinusoidal signal
x = (0:N-1)*T;
subplot(3,1,1); plot(x, y); % plot signal
xlabel('time (s)');
Y = fft(y); % FFT
X = (0:N-1)/N * fs;
subplot(3,1,2); plot(abs(Y(1:N/2))); % plot FFT (index)
xlabel('index');
subplot(3,1,3); plot(X(1:N/2), abs(Y(1:N/2))); % plot FFT (Hz)
xlabel('frequency (Hz)');