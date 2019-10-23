soundfile = load('noisysound.mat');
raw_data = cell2mat(struct2cell(soundfile)); % data = struct2array(soundfile);
fs = 4000;
T = 1/fs;
tmax = 2;
N = fs*tmax; %% 8000

t = [1:N+1]; %% index scale in real time
x = raw_data(t);
n=[0:N];
m=[0:N];

% DFT, X
%X = x*exp(-j*2*pi*m'*n/N); % calculating DFT of x
X = fft(x);
figure(1), plot(x);
title('data with noise');
xlabel('index');
ylabel('amplitude');
set(gca,'xlim',[0 8000]);
figure(2), subplot(2,1,1); plot(abs(X));
title('DFT of Original function');
xlabel('index');
ylabel('amplitude');
set(gca,'xlim',[0 8000]);

subplot(2,1,2); plot((t-1)/tmax, abs(X));
title('DFT of Original function');
xlabel('Frequency [Hz]');
ylabel('amplitude');

abs_amplitude = abs(X(1:N/2));  % To find max value of amplitudes
formatSpec = 'max amplitude: %f occures at %f [Hz].\n';
max_idx = find(abs_amplitude == max(abs_amplitude(:)));
fprintf(formatSpec, max(abs_amplitude), (max_idx-1)/tmax);