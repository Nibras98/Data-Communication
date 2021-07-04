%ID:19-40117-1
pkg load communications;
fs = 10000;
t = [0:1/fs:0.1];
f = 10; % Times at which to sample the sine function
sig = 2*sin(2*pi*f*t); % Original signal, a sine wave
partition = [-1.5, -0.5, 0.5, 1.5]; % Length 4, to represent 5 intervals
codebook = [-2:2]; % Length 5, one entry for each interval
[index,quants] = quantiz(sig,partition,codebook); % Quantize.
figure
plot(t,sig,'x',t,quants,'.')
legend('Original signal','Quantized signal');