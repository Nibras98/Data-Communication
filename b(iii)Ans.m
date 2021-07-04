close all;
clc;
fs =40e3; 
t= 0:1/fs:0.005;
V1 = 90;
V2=4;
FH=11;
BG=97;
AH=11;
S=AH*0.01;
powfund = V2^2/2;
varnoise = S^2;
x=V1*sin(2*pi*(FH*100)*t)+ V2*sin(2*pi*(BG*100)*t)+S*randn(size(t));
m=4;
L=(2^m)-1;
delta= (max(x)-min(x))/L;
xq= min(x)+(round((x-min(x))/delta)).*delta
subplot(3,1,1)
bar(t,x,'r');
subplot(3,1,2);
stem(t,x,'b');
xlabel('time(s)')
ylabel('X[n]')
subplot(3,1,3);
stairs(t,xq,'b');
title('Quantized Signal');
xlabel('time');
ylabel('amplitude');
codes = dec2bin ((round((x-min(x))/delta)),m)