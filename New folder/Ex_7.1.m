%Id:19-40117-1
clc;
clear all;
close all;
Transmitted_Message= 'Red'
%Converting Information Message to bit%
x=asc2bn(Transmitted_Message); 
bp=.000001;
% bit period
disp(' Binary information at Trans mitter :');
disp(x);
bit=[];
for n=1:1:length(x)
 if x(n)==1;
 se=5*ones(1,100);
 else x(n)==0;
 se=zeros(1,100);
 end
 bit=[bit se];
end
t1=bp/100:bp/100:100*length(x)*(bp/100);
subplot(4,1,1);
plot(t1,bit,'lineWidth',2.5);grid on;
axis([ 0 bp*length(x) -.5 6]);
ylabel('amplitude(volt)');
xlabel(' time(sec)');
title('Transmitting information as digital signal');
A1=5; % Amplitude of carrier signal for
A2=0; % Amplitude of carrier signal for
br=1/bp;
% bit rate
f=br*10; %carrier frequency
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
pkg load communications
disp('********')
disp(' Message transmitted through a Transmission medium');
disp('********')
t4=bp/99:bp/99:bp*length(x);
Rec=awgn(m,10);
subplot(4,1,3);
plot(t4,Rec);
axis([ 0 bp*length(x) -6 6]);
xlabel('time(sec)');
ylabel('amplitude(volt)');
title('Received signal at Receiver');
%%%%%%%%%%%%%%%%%
mn=[];
for n=ss:ss:length(Rec)
 t=bp/99:bp/99:bp;
 y=cos(2*pi*f*t); 
 mm=y.*Rec((n-(ss-1)):n);
 t5=bp/99:bp/99:bp;
 z=trapz(t5,mm) ;
% intregation
 zz=round((2*z/bp));
 if(zz>2.5) % logic level =(A1+A2)/2=7.5
 a=1;
 else
 a=0;
 end
 mn=[mn a];
end
disp(' Binary information at Reciver :');
disp(mn);
%%%%%%
bit=[];
for n=1:length(mn);
 if mn(n)==1;
 se=5*ones(1,100);
 else mn(n)==0;
 se=zeros(1,100);
 end
 bit=[bit se];
end
t5=bp/100:bp/100:100*length(mn)*(bp/100);
subplot(4,1,4)
plot(t5,bit,'LineWidth',2.5);grid on;
axis([ 0 bp*length(mn) -.5 6]);
ylabel('amplitude(volt)');
xlabel(' time(sec)');
title('Demodulated signal at receiver');