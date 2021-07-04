ans = menu("Choose Option for sending data", "syncrounous", "asyncrounous");
if ans == 1;
  clc;
  clear all;
  close all;
  Transmitted_Message= 'Syncronous'
  %Converting Information Message to bit%
  x=asc2bn(Transmitted_Message); % Binary Information
  bp=1;
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
  bit
  t1=bp/100:bp/100:100*length(x)*(bp/100);
  subplot(4,1,1);
  plot(t1,bit,'lineWidth',2.5);grid on;
  axis([ 0 bp*length(x) -.5 6]);
  ylabel('amplitude(volt)');
  xlabel(' time(sec)');
  title('Transmitting information as digital signal');

else ans ==2;
clc;
clear all;
close all;
Transmitted_Message= 'Asyncronous'
%Converting Information Message to bit%
x=asc2bn(Transmitted_Message); % Binary Information
bp=1;
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
bit
t1=bp/100:bp/100:100*length(x)*(bp/100);
subplot(4,1,1);
plot(t1,bit,'lineWidth',2.5);grid on;
axis([ 0 bp*length(x) -.5 6]);
ylabel('amplitude(volt)');
xlabel(' time(sec)');
title('Transmitting information as digital signal');
endif