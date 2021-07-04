close all;
clc;
V1 = 90;
V2=4;
FH=11;
BG=97;
fs = 40000;
t = 0:1/fs:1-1/fs;
powfund = V2^2/2;
x=V1*sin(2*pi*(FH*100)*t)+ V2*sin(2*pi*(BG*100)*t);
fx = fft(x);
fx = fftshift(fx)/(fs/2);
f = fs/2*linspace(0,1,fs);
figure
plot(t,x,'-r','LineWidth',0.5);
axis([0.5,0.60,-135,135]);
xlabel('time(s)');
ylabel('Amplitude(V)');
title('TIME DOMAIN');
figure
plot(f, abs(fx),'b-o','LineWidth',1.5);
xlabel('Frequency (Hz)');
ylabel('magnitude');
title('FREQUENCY DOMAIN');