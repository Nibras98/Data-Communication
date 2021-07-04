fs = 8000;
f = 400; %Hz
%Define signal
t = 0:1/fs:1-1/fs;
signal = 1.2*sin(2*pi*f*t);
%Plot to illustrate that it is a sine wave
plot(t, signal);
title('Time-Domain signal');
xlabel('Time (s)');
ylabel('amplitude');
%Take fourier transform
fftSignal = fft(signal);
%apply fftshift to put it in the form we are used to (see documentation)
fftSignal = fftshift(fftSignal)/(fs/2);%scaling done by dividing with (fs/2)
%Next, calculate the frequency axis, which is defined by the sampling rate
f = fs/2*linspace(-1,1,fs);
%Since the signal is complex, we need to plot the magnitude to get it to
%look right, so we use abs (absolute value)
figure;
plot(f, abs(fftSignal));
title('magnitude FFT of sine');
xlabel('Frequency (Hz)');
ylabel('magnitude');
%noise
noise = 2*randn(size(signal));
figure
plot(t,noise)
xlabel('Time (s)');
ylabel('Amplitude');
title('Time-Domain Noise');
fftNoise = fft(noise);
fftNoise = fftshift(fftNoise)/(fs/2);
figure
plot(f,abs(fftNoise))
title('Magnitude FFT of noise');
xlabel('Frequency (Hz)');
ylabel('magnitude');
%noisy signal
noisySignal = signal + noise;
figure
plot(t,noisySignal)
xlabel('Time (s)');
ylabel('Amplitude');
title('Time-Domain Noisy Signal');
fftNoisySignal = fft(noisySignal);
fftNoisySignal = fftshift(fftNoisySignal)/(fs/2);
figure
plot(f,abs(fftNoisySignal))
title('Magnitude FFT of noisy signal');
xlabel('Frequency (Hz)');
ylabel('magnitude');