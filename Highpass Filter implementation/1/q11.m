t = 0:0.001:1;
x = cos(2*20*pi*t);
figure(1)
plot(t,x) 
Y = fft(x);
L = length(t);
f =-(L-1)/2:(L-1)/2;
figure(2)
plot(f,fftshift(abs(Y))) 

fc = 200;
fs = 1000;
ydouble = ammod(x,fc,fs);
figure(3)
plot(t,ydouble) 
Y2 = fft(ydouble);
L = length(t);
f =-(L-1)/2:(L-1)/2;
figure(4)
plot(f,fftshift(abs(Y2)))


z = amdemod(ydouble,fc,fs);
figure(5);
plot(t, z);
figure(6);
plot(f, fftshift(abs(fft(z))));

ydouble = x.*cos(2*pi*fc*t);
figure(7)
plot(t,ydouble) 
Y2 = fft(ydouble);
L = length(t);
f =-(L-1)/2:(L-1)/2;
figure(8)
plot(f,fftshift(abs(Y2)))

z1 = ydouble.*cos(2*pi*fc*t);
z2 = lowpass(z1,fc,fs);
figure(9);
plot(t, z2);
figure(10);
plot(f, fftshift(abs(fft(z2))));
