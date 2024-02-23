syms k2
A = [2*10^(-8) 2*0.05/150000; 2*0.08/k2 2*10^(-8)];
b = [0.05; 0.08];
s = A\b
y = s(1)
x = s(2)
dx = diff(x, k2)
dy = diff(y, k2)
sx = subs(dx, k2, 400000)*400000/69103;
sy = subs(dy, k2, 400000)*400000/196545;

disp(['S(x, k2) is ', num2str(double(sx))]);
disp(['S(y, k2) is ', num2str(double(sy))]);