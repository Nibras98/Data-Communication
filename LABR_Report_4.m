%%My Id=19-40117-1
close all;
clc;
fs = 40000;
t = 0:1/fs:1-1/fs;
A1=19;
A2=11;
s=0.11;
powfund = A2^2/2;
varnoise = s^2;
C=4;
G=7;
signal=A1*sin(2*pi*(C*100)*t)+A2*cos(2*pi*(G*100)*t)+s*randn(size(t));
defSNR = 10*log10(powfund/varnoise)
Fmin=400;
Fmax=700;
bandwidth=Fmax-Fmin
c= bandwidth*log2(1+defSNR)%capacity
L=2^(c/(2*bandwidth))%signal level
