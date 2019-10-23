clear;
f1 = 0.1; % frequency of the signal
f2 = 0.2;
f3 = 0.3;
f4 = 0.8;
fs = 100 ; % sampling frequency
T = 1/fs; % sampling interval
tmax = 10; % play time
t = 0:T:tmax-T; % sample points
N = fs * tmax; % total number of samples
y = sin(2*pi*f1*t) + sin(2*pi*f2*t) + sin(2*pi*f3*t) + sin(2*pi*f4*t);
x = (0:N-1)*T;
subplot(3,2,1); plot(x, y); % plot signal
xlabel('time (s)'); grid on;
Y = fft(y);
subplot(3,2,2); plot((0:N-1)/N*fs, abs(Y), '-*');
xlabel('frequency (Hz)'); grid on; xlim([0 2]);
fs = 2 ; % sampling frequency
T = 1/fs; % sampling interval
tmax = 10; % play time
t = 0:T:tmax-T; % sample points
N = fs * tmax; % total number of samples
y = sin(2*pi*f1*t) + sin(2*pi*f2*t) + sin(2*pi*f3*t) + sin(2*pi*f4*t);
x = (0:N-1)*T;
subplot(3,2,3); plot(x, y, 'o'); % plot signal
xlabel('time (s)'); grid on;
subplot(3,2,4); plot(x, y, 'o'); % plot signal
xlabel('time (s)'); grid on;
yy = resample(y, 100, fs);
subplot(3,2,4); hold on; plot(0:0.01:9.99, yy);
fs = 1 ; % sampling frequency
T = 1/fs; % sampling interval
tmax = 10; % play time
t = 0:T:tmax-T; % sample points
N = fs * tmax; % total number of samples
y = sin(2*pi*f1*t) + sin(2*pi*f2*t) + sin(2*pi*f3*t) + sin(2*pi*f4*t);
x = (0:N-1)*T;
subplot(3,2,5); plot(x, y, 'o'); % plot signal
xlabel('time (s)'); grid on;
subplot(3,2,6); plot(x, y, 'o'); % plot signal
xlabel('time (s)'); grid on;
yy = resample(y, 100, fs);
subplot(3,2,6); hold on; plot(0:0.01:9.99, yy);