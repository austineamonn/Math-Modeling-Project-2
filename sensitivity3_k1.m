syms k1

A = [18*10^(-8) 12*2*0.05/k1; 6*2*0.08/400000 18*10^(-8)];
b = [12*0.05; 6*0.08];
s = A\b
y = s(1)
x = s(2)
dx = diff(x, k1)
dy = diff(y, k1)
sx = subs(dx, k1, 150000)*150000/70619;
sy = subs(dy, k1, 150000)*150000/194703;

disp(['S(x, k1) is ', num2str(double(sx))]);
disp(['S(y, k1) is ', num2str(double(sy))]);