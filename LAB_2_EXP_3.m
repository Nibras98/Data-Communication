fs = 8000; % Sampling frequency
t = 0:1/fs:1-1/fs; % Time duration
cx = 1.1*sin(2*pi*100*t) + 1.3*cos(2*pi*300*t) + 1.5*sin(2*pi*2000*t);
bandwidth = 2000-100

