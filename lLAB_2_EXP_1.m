%ID:19-40125-1
fs = 1000;
t = 0:1/fs:1-1/fs;
f1 = 12;
f2 = 6;
A1 = 1.5;
A2 = 1.1;
x1 = A1*sin(2*pi*f1*t);
x2 = A2*sin(2*pi*f2*t);
plot(t,x1,'k--o','LineWidth',1.5)
hold on
plot(t,x2,'b-*','LineWidth',2)
hold off
xlabel('time in seconds')
ylabel('Amplitude in volts')
title('Signals of different Frequencies')