syms r2
A = [2*10^(-8) 2*0.05/150000; 2*r2/400000 2*10^(-8)];
b = [0.05; r2];
s = A\b
y = s(1)
x = s(2)
dx = diff(x, r2)
dy = diff(y, r2)
sx = subs(dx, r2, 0.08)*0.08/69103;
sy = subs(dy, r2, 0.08)*0.08/196545;

disp(['S(x, r2) is ', num2str(double(sx))]);
disp(['S(y, r2) is ', num2str(double(sy))]);