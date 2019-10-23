clear;
close all;

%% question a

Ts = .1e-3;
fs = 1/Ts;
tmax = 0.06;
t = [0:Ts:tmax-Ts];
N = tmax*fs;
x = 100*t.*exp(-150*abs(t-0.02)).*sin(200*pi*t);

subplot(3,1,1); plot(t,x,'-');
xlabel('time (ms)');
ylabel('signal, x(t)');
ylim([-2 2]);
xlim('auto');

%% question b

X = fft(x);

subplot(3,1,2); plot(t/Ts/N*fs, abs(X), '*-');
xlabel('frequency (Hz)');
ylabel('spectrum');
xlim('auto');


%% question c

xx = resample(x, 10*fs, fs);
t_resample = [0:Ts/10:tmax-Ts/10];
xx_original = 100*t_resample.*exp(-150*abs(t_resample-0.02)).*sin(200*pi*t_resample);

subplot(3,1,3); plot(t_resample, xx, 'b');
hold on; plot(t_resample,xx_original,'r');
xlabel('time (ms)');
ylabel('reconstructed signal, x(t)');
ylim([-2 2]);

