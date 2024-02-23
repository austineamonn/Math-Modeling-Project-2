syms r2

A = [18*10^(-8) 12*2*0.05/150000; 6*2*r2/400000 18*10^(-8)];
b = [12*0.05; 6*r2];
s = A\b
y = s(1)
x = s(2)
dx = diff(x, r2)
dy = diff(y, r2)
sx = subs(dx, r2, 0.08)*0.08/70619;
sy = subs(dy, r2, 0.08)*0.08/194703;

disp(['S(x, r2) is ', num2str(double(sx))]);
disp(['S(y, r2) is ', num2str(double(sy))]);