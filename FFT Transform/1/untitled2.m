t = 0:0.01:2;
x = heaviside(t).*heaviside(1-t);
idx = x == 0.5; 
x(idx) = 1;
Y = myfft(x);
L = length(t);
f =0:(L-1);
plot(f,abs(Y)) 
