%ID:19-40117-1
close all;
clc;
%Define number of samples to take
fs = 8000; % Sampling frequency
f = 400; %Hz
%Define signal
t = 0:1/fs:1-1/fs;
A = 3.0;
powfund = A^2/2
s = 0.1;
varnoise = s^2;
signal = A*sin(2*pi*f*t);
%noise
noise = s*randn(size(signal));
%noisy signal
noisySignal = signal + noise;
defSNR = 10*log10(powfund/varnoise) %Calculation of SNR following the definition