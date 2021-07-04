%Nibras, Shamit
%19-40117-1
pkg load image
pkg load communications;
clc;
clear all;
I = imread('1.png');
B = dec2bin(I);
C = reshape(B',1,numel(B));
x=C;
bp=1;   % bit period
%disp(' Binary information at Trans mitter :');
%XX representation of transmitting binary information as
len = length(x);
bit=[];
for n=1:1:length(x)
  if x(n)=='1';
    se=5*ones(1,10);
  else x(n)=='0';
    se=zeros(1,10);
  end
    bit=[bit se];
end
t1=bp/10:bp/10:10*length(x)*(bp/10);
subplot(5,1,1);
plot(t1,bit,'lineWidth',2.5);
grid on;
axis([ 0 bp*length(x) -.5 6]);
ylabel('amplitude(volt)');
xlabel(' time(sec)');
title('Transmitting information as digital signal');
A = 5;
br=1/bp;    % bit rate
f = br*5;   %carrier frequency
t2=bp/99:bp/99:bp;
ss=length(t2);
x1=[];
x2 =[];
for i=1:1:len
  if(mod(i,2) == 1)
    x1 = [x1 x(i)];
  else
    x2 = [x2 x(i)];
   end
end
QPSK=[];
for (i=1:1:length(x1))
  if x1(i)=='1'
    psk1=sin(2*pi*f*t2);
  else
    psk1=sin(2*pi*f*t2+pi);
  end
  if x2(i)=='1'
    psk2=sin(2*pi*f*t2+pi/2);
  else
    psk2=sin(2*pi*f*t2+pi+pi/2);
  end
 QPSK=[QPSK psk1 psk2];
end
t3=bp/99:bp/99:bp*length(x);
subplot(5,1,2);
plot(t3,QPSK);
axis([ 0 bp*length(x) -1.5 1.5]);
xlabel('time(sec)');
ylabel('amplitude(volt)');
title('Modulated Signal at Transmitter');
disp('**********')
disp(' Message transmitted through a Transmission medium');
disp('*******');
t4=bp/99:bp/99:bp*length(x);
Rec=awgn(QPSK,0.5);%adding addative gausian noise
subplot(5,1,3);
plot(t4,Rec);
axis([ 0 bp*length(x) -6 6]);
xlabel('time(sec)');
ylabel('amplitude(volt)');
title('Received signal at Receiver');
lr = length(Rec);
mn=[];
for n=ss:ss:lr
t=bp/99:bp/99:bp;
y=sin(2*pi*f*t); %carrier siignal
mm=y.*Rec((n-(ss-1)):n);
t5=bp/99:bp/99:bp;
z=trapz(t5,mm) ;  
zz=round((2*z/bp));
if(zz>2.5) % logic level =(A1+A2)/2=7.5
  a=1;
else
  a=0;
end
 mn=[mn a];
end
disp(' Binary information at Reciver :');
disp(mn);   %XXXXX Representation of binary information as digital signal which achived
%after ASK demodulation XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
bit=[];
for n=1:length(mn);
  if mn(n)=='1';
    se=5*ones(1,10);
  else mn(n)=='0';
    se=zeros(1,10);
  end
  bit=[bit se];
end
t5=bp/10:bp/10:10*length(mn)*(bp/10);
subplot(5,1,4)
plot(t5,bit,'LineWidth',2.5);grid on;
axis([ 0 bp*length(mn) -.5 6]);
ylabel('amplitude(volt)');
xlabel(' time(sec)');
title('Demodulated signal at receiver');mn = x;
t5=bp/10:bp/10:10*length(mn)*(bp/10);
subplot(5,1,4)
plot(t5,bit,'LineWidth',2.5);grid on;
axis([ 0 bp*length(mn) -.5 6]);
ylabel('amplitude(volt)');
xlabel(' time(sec)');
title('Demodulated signal at receiver');
D = reshape(mn, size(B,2),size(B,1));
I_out = uint8(reshape(bin2dec(D'),size(I)));
imshow(I_out);    %Show image  
