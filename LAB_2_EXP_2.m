%ID:19-40125-1
%Take fourier transform
fx1 = fft(x1);
fx2 = fft(x2);
%apply fftshift to put it in the form we are used to (see documentation)
fx1 = fftshift(fx1)/(fs/2);
fx2 = fftshift(fx2)/(fs/2);
%Next, calculate the frequency axis, which is defined by the sampling rate
f = fs/2*linspace(-1,1,fs);
%Since the signal is complex, we need to plot the magnitude to get it to
%look right, so we use abs (absolute value)
figure;
plot(f, abs(fx1), f, abs(fx2),'LineWidth',1.5);
title('magnitude FFT of sine');
axis([-100 100 0 2])
xlabel('Frequency (Hz)');
ylabel('magnitude');