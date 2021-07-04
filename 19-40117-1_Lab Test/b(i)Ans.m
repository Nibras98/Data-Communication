close all;
clc;
fs = 40000; 
t = 0:1/fs:1-1/fs;
V1 = 90;
V2=4;
FH=11;
BG=97;
AH=11;
S=AH*0.01;
powfund = V2^2/2;
varnoise = S^2;
x=V1*sin(2*pi*(FH*100)*t)+ V2*sin(2*pi*(BG*100)*t)+S*randn(size(t));
defSNR = 10*log10(powfund/varnoise)