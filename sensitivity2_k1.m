syms k1
A = [10^(-8) 0.05/k1; 0.08/400000 10^(-8)];
b = [0.05; 0.08];
s = A\b
y = s(1)
x = s(2)
dx = diff(x, k1)
dy = diff(y, k1)
sx = subs(dx, k1, 150000)*150000/138207;
sy = subs(dy, k1, 150000)*150000/393090;

disp(['S(x, k1) is ', num2str(double(sx))]);
disp(['S(y, k1) is ', num2str(double(sy))]);