t = -1:0.02:5;
x = heaviside(t).*heaviside(4-t);
idx = x == 0.5; 
x(idx) = 1;
Y = myfft(x);
L = length(t);
f =0:(L-1);
figure(1)
stem(f,abs(Y)) 
figure(2)
stem(f,angle(Y)) 
