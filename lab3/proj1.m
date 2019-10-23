sampling_freq = 8000;

t_original = 0:1/80000:2;
t_sample = 0:1/sampling_freq:2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function_freq_1 = 200;

y_original = sin(2*pi*function_freq_1*t_original);
y_sample = sin(2*pi*function_freq_1*t_sample);

figure(1);
plot(t_original,y_original,'r-',t_sample,y_sample,'o');
legend('original', 'sampled');
%set(gca,'xlim',[0 1/function_freq*30]);
set(gca,'xlim',[0 1/50]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function_freq_2 = 7800;

y_original_2 = sin(2*pi*function_freq_2*t_original);
y_sample_2 = sin(2*pi*function_freq_2*t_sample);

figure(2);
plot(t_original,y_original_2,'r-',t_sample,y_sample_2,'o');
legend('original', 'sampled');
%set(gca,'xlim',[0 1/function_freq*30]);
set(gca,'xlim',[0 1/50]);


sound(y_sample);
pause(2);

sound(y_sample_2);
pause(2);

clear;