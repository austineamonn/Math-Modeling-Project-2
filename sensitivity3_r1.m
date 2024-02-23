syms r1

A = [18*10^(-8) 12*2*r1/150000; 6*2*0.08/400000 18*10^(-8)];
b = [12*r1; 6*0.08];
s = A\b
y = s(1)
x = s(2)
dx = diff(x, r1)
dy = diff(y, r1)
sx = subs(dx, r1, 0.05)*0.05/70619;
sy = subs(dy, r1, 0.05)*0.05/194703;

disp(['S(x, r1) is ', num2str(double(sx))]);
disp(['S(y, r1) is ', num2str(double(sy))]);