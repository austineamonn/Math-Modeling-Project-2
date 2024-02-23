syms k2

A = [18*10^(-8) 2*2*0.05/150000; 6*2*0.08/k2 18*10^(-8)];
b = [12*0.05; 6*0.08];
s = A\b
y = s(1)
x = s(2)
dx = diff(x, k2)
dy = diff(y, k2)
sx = subs(dx, k2, 400000)*400000/70619;
sy = subs(dy, k2, 400000)*400000/194703;

disp(['S(x, k2) is ', num2str(double(sx))]);
disp(['S(y, k2) is ', num2str(double(sy))]);