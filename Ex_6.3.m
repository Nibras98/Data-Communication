%XXXXXXXXXXXXXXXXXXXXXXX Binary-ASK modulation
XXXXXXXXXXXXXXXXXXXXXXXXXXX%
A1=5; % Amplitude of carrier signal for
information 1
A2=0; % Amplitude of carrier signal for
information 0
br=1/bp;
% bit rate
f=br*10; %
carrier frequency
t2=bp/99:bp/99:bp;
ss=length(t2);
m=[];
for (i=1:1:length(x))
 if (x(i)==1)
 y=A1*cos(2*pi*f*t2);
 else
 y=A2*cos(2*pi*f*t2);
 end
 m=[m y];
end
t3=bp/99:bp/99:bp*length(x);
subplot(4,1,2);
plot(t3,m);
axis([ 0 bp*length(x) -6 6]);
xlabel('time(sec)');
ylabel('amplitude(volt)');
title('Modulated Signal at Transmitter');
