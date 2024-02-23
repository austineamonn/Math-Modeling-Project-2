syms a

A = [18*a 12*2*0.05/150000; 6*2*0.08/400000 18*a];
b = [12*0.05; 6*0.08];
s = A\b
y = s(1)
x = s(2)
dx = diff(x, a)
dy = diff(y, a)
sx = subs(dx, a, 10^(-8))*10^(-8)/70619;
sy = subs(dy, a, 10^(-8))*10^(-8)/194703;

disp(['S(x, a) is ', num2str(double(sx))]);
disp(['S(y, a) is ', num2str(double(sy))]);