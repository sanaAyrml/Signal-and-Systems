fs = 2000;
t = (-1:1/fs:1);
fc = 200;
wm = 40*pi;
yt = (1+0.5*cos(wm*t)).*cos(2*pi*fc*t);
figure(4)
plot(t,yt)
figure(5);
f = -(length(t)-1)/2:(length(t)-1)/2;
plot(f, fftshift(abs(fft(yt))));
z = sqrt(yt.*yt+myhilbert(t,yt).*myhilbert(t,yt));
figure(6)
plot(t,abs(z))