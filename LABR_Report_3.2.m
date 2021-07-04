pkg load communications
fs = 2000;
dt = 1/fs;
stopTime = 2;
A1=70;
A2=11;
C=4;
F=1;
t = (-2:dt:stopTime);
x1 = A1*cos(2 * pi * C * 100 *t );
x2 = A2*cos(2 * pi * F * 100 *t );
x3 = x1 + x2;
L=6;
delta=(max(x3)-min(x3))/L;
xq=min(x3)+(round((x3-min(x3))/delta)).*delta;
subplot(3,1,1);
bar(t,x3,'r');
subplot(3,1,2);
stem(t,x3,'b');
xlabel('time(s)')
ylabel('X[n]');
subplot(3,1,3);
stairs(t,xq,'b');
title('Quantized Signal');
xlabel('time');
ylabel('amplitude');
