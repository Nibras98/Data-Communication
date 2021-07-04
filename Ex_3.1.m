%ID:19-40117-1
Am=4; %setting the sine wave amplitude
bit=3; % setting the number btis
f=1; %sine wave frequency
fs=30; % setting sampling frequency
t=0:1/fs:1*pi;
y=Am*sin(2*pi*f*t);
Nsamples=length(y);
quantised_out=zeros(1,Nsamples);
del=2*Am/(2^bit);
Llow=-Am+del/2; 
Lhigh=Am-del/2;
for i=Llow:del:Lhigh
  for j=1:Nsamples
    if(((i-del/2)<y(j))&&(y(j)<(i+del/2)))
    quantised_out(j)=i;
  end
  end
  end
stem(t,quantised_out);
hold on; 
plot(t,y,'color','r');
