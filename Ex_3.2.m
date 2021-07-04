%ID:19-40117-1
fs=40e3;% sampling frequency
fc=4e3;% frequency of the signal
t=0:1/fs:0.001;%discrete time
x=0.5*sin(2*pi*fc*t);% discrete signal
n=8;
L=(2^n)-1;
delta=(max(x)-min(x))/L;
xq=min(x)+(round((x-min(x))/delta)).*delta
subplot(2,1,1)
stem(t,x,'r');
subplot(2,1,2);% breaking the window figure to plot both graphs
stem(t,x,'b');% plot of discrete time signaltitle('Discrete time representation')% title of the figure
xlabel('time(s)')% label on the x-axis of the plot
ylabel('X[n]')% label on the y-axis of the plot
subplot(2,1,2);
stairs(t,xq,'b');% the quantized output
title('Quantized Signal')% title of the figure
xlabel('time')% label on the x-axis of the plot
ylabel('amplitude')% label on the y-axis of the plot
