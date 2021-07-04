fs = 10000;
t = [0:1/fs:0.1];
f = 10;
sig = 2*sin(2*pi*f*t);
partition = [-1.5, -0.5, 0.5, 1.5];
codebook = [-2:2];
[index,quants] = quantiz(sig,partition,codebook);
figure
plot(t,sig,'x',t,quants,'.')
legend('Original signal','Quantized signal');