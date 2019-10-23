N = 25;

n_domain = [0:1/1000:100];
% Original function of sawtooth, x_original.
x_original = sawtooth(n_domain+pi/2,0.5);

n = [0:N-1];
M = 9;
m = [0:M-1];

% a = [-0.0200 -0.1194 -0.1175 -0.1144 -0.1101 -0.1047 -0.0983 -0.0910 -0.0829];
% b = [0 -0.6258 -0.2967 -0.1802 -0.1172 -0.0761 -0.0463 -0.0234 -0.0052];
% 
% xhat = a*cos(2*pi*m'*n/N) + b*sin(2*pi*m'*n/N);


% Sample vector, x.
x = sawtooth(n+pi/2,0.5);
% a and b coefficients. Note: b0=0 and a0/2 replaces a0.
a = (2/N)*x*cos(2*pi*n'*m/N);
a(1) = a(1)/2;
b = (2/N)*x*sin(2*pi*n'*m/N);
%xhat = a*cos(2*pi*m'*n/N) + b*sin(2*pi*m'*n/N);
%plot(n_original, x_original, '-k', n, xhat, 'o');

xhat = a*cos(2*pi*m'*n_domain/N) + b*sin(2*pi*m'*n_domain/N);
plot(n_domain, x_original, '-k', n_domain, xhat, 'b--');

set (gca , 'xlim' , [0 50]);
set (gca , 'ylim' , [ -2 2]);
