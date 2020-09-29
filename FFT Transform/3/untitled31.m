t = 0:0.01:10;
x = sin(10*pi*t);
y = sin(10*pi*t) .* cos(400*pi*t);
figure(1)
plot(t,x) 
figure(2)
plot(t,y) 
Y = myfft(y);
L = length(t);
f =0:(L-1);
figure(3)
plot(f,abs(Y)) 
Y = myfft(x);
L = length(t);
f =0:(L-1);
figure(4)
plot(f,abs(Y)) 