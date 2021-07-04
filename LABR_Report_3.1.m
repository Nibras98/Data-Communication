A1=74;
A2=11;
CDE=401;
fs= 40e3;
t= 0:1/fs:0.005;
x= A1*cos(2*pi*(CDE*100)*t);
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
codes = dec2bin ((round((x-min(x))/delta)),n)
