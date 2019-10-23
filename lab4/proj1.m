soundfile = load('noisysound.mat');
raw_data = cell2mat(struct2cell(soundfile));
fs = 4000;
T = 1/fs;
tmax = 2;
N = fs*tmax; %% 8000

t = [1:tmax:N]/fs; %% index scale in real time
sampled_data = raw_data(1:tmax:N); %% indices should be an integer.

N = length(t);

figure(1); plot(t,sampled_data);
title('sampled at frequency 4000Hz');
xlabel('time [s]');
ylabel('amplitude');

% Waveform values with periodic extension.

max_corr = zeros(1,20);

for fref=431:450
y = sin(2*pi*fref*t);
yy = [y, y];
% Correlation function.
for m=0:N-1
phi(m+1) = (1/N)*sampled_data*yy(m+1:m+N)'; % correlation function
end
max_corr(fref-430) = max(abs(phi));
end

figure(2), clf; plot([431:450], max_corr, 'k');
title('correlation function between sinusoidal and noise');
xlabel('reference frequency (Hz)');
ylabel('correlation');

formatSpec = 'max correlation: %f occures at freq: %f.\n';
fprintf(formatSpec, max(max_corr), find(max_corr == max(max_corr(:)))+430);

