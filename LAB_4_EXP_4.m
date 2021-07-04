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

SNR = (powfund/varnoise)

BandWith=2000-100;

C = bandwidth*log2(1+SNR)