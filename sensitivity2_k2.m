syms k2
A = [10^(-8) 0.05/150000; 0.08/k2 10^(-8)];
b = [0.05; 0.08];
s = A\b
y = s(1)
x = s(2)
dx = diff(x, k2)
dy = diff(y, k2)
sx = subs(dx, k2, 400000)*400000/138207;
sy = subs(dy, k2, 400000)*400000/393090;

disp(['S(x, k2) is ', num2str(double(sx))]);
disp(['S(y, k2) is ', num2str(double(sy))]);