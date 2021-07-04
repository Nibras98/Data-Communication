%ID:19-40117-1
close all;
clc;
fs = 8000; % Sampling frequency
t = 0:1/fs:1-1/fs; % Time duration
cx = 1.1*sin(2*pi*100*t) + 1.3*cos(2*pi*300*t) + 1.5*sin(2*pi*2000*t);
bandwidth = 2000-100; % Bandwidth of the signal
L=2; % Level of the signal
BitRate = 2*bandwidth*log2(L)