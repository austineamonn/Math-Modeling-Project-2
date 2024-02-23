syms r1
A = [10^(-8) r1/150000; 0.08/400000 10^(-8)];
b = [r1; 0.08];
s = A\b
y = s(1)
x = s(2)
dx = diff(x, r1)
dy = diff(y, r1)
sx = subs(dx, r1, 0.05)*0.05/138207;
sy = subs(dy, r1, 0.05)*0.05/393090;

disp(['S(x, r1) is ', num2str(double(sx))]);
disp(['S(y, r1) is ', num2str(double(sy))]);