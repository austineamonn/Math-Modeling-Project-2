syms a
A = [a 0.05/150000; 0.08/400000 a];
b = [0.05; 0.08];
s = A\b
y = s(1)
x = s(2)
dx = diff(x, a)
dy = diff(y, a)
sx = subs(dx, a, 10^(-8))*10^(-8)/138207;
sy = subs(dy, a, 10^(-8))*10^(-8)/393090;

disp(['S(x, a) is ', num2str(double(sx))]);
disp(['S(y, a) is ', num2str(double(sy))]);