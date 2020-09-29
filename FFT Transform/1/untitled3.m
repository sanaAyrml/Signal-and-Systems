t = 0:0.01:2;
x = heaviside(t).*heaviside(1-t);
idx = x == 0.5; 
x(idx) = 1;
Y = fft(x);
L = length(t);
Yshift = fftshift(Y);
P2 = abs(Yshift/L);
% P1 = P2(1:L/2+1);
f =0:(L-1);
plot(f,P2) 