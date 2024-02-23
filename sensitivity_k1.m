syms k1
A = [2*10^(-8) 2*0.05/k1; 2*0.08/400000 2*10^(-8)];
b = [0.05; 0.08];
s = A\b
y = s(1)
x = s(2)
dx = diff(x, k1)
dy = diff(y, k1)
sx = subs(dx, k1, 150000)*150000/69103;
sy = subs(dy, k1, 150000)*150000/196545;

disp(['S(x, k1) is ', num2str(double(sx))]);
disp(['S(y, k1) is ', num2str(double(sy))]);