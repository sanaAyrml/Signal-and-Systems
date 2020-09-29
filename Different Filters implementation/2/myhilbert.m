function y=myhilbert(t,x)
Y = fft(x);
L = length(t);
f =-(L-1)/2:(L-1)/2;
dum=-sqrt(-1)*sign(f).*Y;
y = ifft(dum);
