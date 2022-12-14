syms w
fx=w.^2;
fy=1-w.^2;

w = [-10:0.001:10];
y1=subs(fx)
y2=subs(fy)

plot(y1,y2)
grid on
