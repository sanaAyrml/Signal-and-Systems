t = -5:0.01:5;
x = sin(100*t).*exp(-i*pi*t);
Y = myfft(x);
L = length(t);
f =0:(L-1);
figure(1)
stem(f,abs(Y)) 
figure(2)
stem(f,angle(Y)) 