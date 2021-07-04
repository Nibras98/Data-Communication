%ID:19-40117-1
fs = 48e3;
t = 0:1/fs:1-1/fs;
A = 1.0;
powfund = A^2/2;
a = 0.4;
powharm = a^2/2;
s = 0.1;
varnoise = s^2;
x = A*cos(2*pi*1000*t) + a*sin(2*pi*2000*t) + s*randn(size(t));

defTHD = 10*log10(powharm/powfund);
TH = [defTHD]

defSINAD = 10*log10(powfund/(powharm+varnoise));
SI = [defSINAD]