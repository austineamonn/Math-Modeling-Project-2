A_g = [2*10^(-8) 0.1/150000; 0.16/400000 2*10^(-8)];
b_g = [0.05; 0.08];
x_g = A_g\b_g;

disp(['The maximum growth rate is achieved at blue whale population at ', num2str(double(x_g(2)))]);
disp(['The maximum growth rate is achieved at fin whale population at ', num2str(double(x_g(1)))]);

syms r1
A = [2*10^(-8) 2*r1/150000; 0.16/400000 2*10^(-8)];
b = [r1; 0.08];
s = A\b;
y = s(1);
x = s(2);
dx = diff(x, r1);
dy = diff(y, r1);
sx = subs(dx, r1, 0.05)*0.05/69103;
sy = subs(dy, r1, 0.05)*0.05/196545;

disp(['S(x, r1) (maximum growth rate) is ', num2str(double(sx))]);
disp(['S(y, r1) (maximum growth rate) is ', num2str(double(sy))]);


syms r2
A = [2*10^(-8) 2*0.05/150000; 2*r2/400000 2*10^(-8)];
b = [0.05; r2];
s = A\b;
y = s(1);
x = s(2);
dx = diff(x, r2);
dy = diff(y, r2);
sx = subs(dx, r2, 0.08)*0.08/69103;
sy = subs(dy, r2, 0.08)*0.08/196545;

disp(['S(x, r2) (maximum growth rate) is ', num2str(double(sx))]);
disp(['S(y, r2) (maximum growth rate) is ', num2str(double(sy))]);


syms k1
A = [2*10^(-8) 2*0.05/k1; 2*0.08/400000 2*10^(-8)];
b = [0.05; 0.08];
s = A\b;
y = s(1);
x = s(2);
dx = diff(x, k1);
dy = diff(y, k1);
sx = subs(dx, k1, 150000)*150000/69103;
sy = subs(dy, k1, 150000)*150000/196545;

disp(['S(x, k1) (maximum growth rate) is ', num2str(double(sx))]);
disp(['S(y, k1) (maximum growth rate) is ', num2str(double(sy))]);



syms k2
A = [2*10^(-8) 2*0.05/150000; 2*0.08/k2 2*10^(-8)];
b = [0.05; 0.08];
s = A\b;
y = s(1);
x = s(2);
dx = diff(x, k2);
dy = diff(y, k2);
sx = subs(dx, k2, 400000)*400000/69103;
sy = subs(dy, k2, 400000)*400000/196545;

disp(['S(x, k2) (maximum growth rate) is ', num2str(double(sx))]);
disp(['S(y, k2) (maximum growth rate) is ', num2str(double(sy))]);


syms a
A = [2*a 2*0.05/150000; 2*0.08/400000 2*a];
b = [0.05; 0.08];
s = A\b;
y = s(1);
x = s(2);
dx = diff(x, a);
dy = diff(y, a);
sx = subs(dx, a, 10^(-8))*10^(-8)/69103;
sy = subs(dy, a, 10^(-8))*10^(-8)/196545;

disp(['S(x, a) (maximum growth rate) is ', num2str(double(sx))]);
disp(['S(y, a) (maximum growth rate) is ', num2str(double(sy))]);

syms a
A = [2*a 2*0.05/150000; 2*0.08/400000 2*a];
b = [0.05; 0.08];
s = A\b;
y = s(1);
x = s(2);


solution_a = solve(x == 0, a);
disp(['total growth rate for the whales is maximized if blue whale is driven to extinction at a=', num2str(double(solution_a))]);


A = [10^(-8) 0.05/150000; 0.08/400000 10^(-8)];
b = [0.05; 0.08];
x = A\b;

disp(['The maximum population is achieved at blue whale population at ', num2str(double(x(2)))]);
disp(['The maximum population is achieved at fin whale population at ', num2str(double(x(1)))]);

syms r1
A = [10^(-8) r1/150000; 0.08/400000 10^(-8)];
b = [r1; 0.08];
s = A\b;
y = s(1);
x = s(2);
dx = diff(x, r1);
dy = diff(y, r1);
sx = subs(dx, r1, 0.05)*0.05/138207;
sy = subs(dy, r1, 0.05)*0.05/393090;

disp(['S(x, r1) (maximum population) is ', num2str(double(sx))]);
disp(['S(y, r1) (maximum population) is ', num2str(double(sy))]);



syms r2
A = [10^(-8) 0.05/150000; r2/400000 10^(-8)];
b = [0.05; r2];
s = A\b;
y = s(1);
x = s(2);
dx = diff(x, r2);
dy = diff(y, r2);
sx = subs(dx, r2, 0.08)*0.08/138207;
sy = subs(dy, r2, 0.08)*0.08/393090;

disp(['S(x, r2) (maximum population) is ', num2str(double(sx))]);
disp(['S(y, r2) (maximum population) is ', num2str(double(sy))]);


syms k1
A = [10^(-8) 0.05/k1; 0.08/400000 10^(-8)];
b = [0.05; 0.08];
s = A\b;
y = s(1);
x = s(2);
dx = diff(x, k1);
dy = diff(y, k1);
sx = subs(dx, k1, 150000)*150000/138207;
sy = subs(dy, k1, 150000)*150000/393090;

disp(['S(x, k1) (maximum population) is ', num2str(double(sx))]);
disp(['S(y, k1) (maximum population)is ', num2str(double(sy))]);

syms k2
A = [10^(-8) 0.05/150000; 0.08/k2 10^(-8)];
b = [0.05; 0.08];
s = A\b;
y = s(1);
x = s(2);
dx = diff(x, k2);
dy = diff(y, k2);
sx = subs(dx, k2, 400000)*400000/138207;
sy = subs(dy, k2, 400000)*400000/393090;

disp(['S(x, k2) (maximum population) is ', num2str(double(sx))]);
disp(['S(y, k2) (maximum population) is ', num2str(double(sy))]);


syms a
A = [a 0.05/150000; 0.08/400000 a];
b = [0.05; 0.08];
s = A\b;
y = s(1);
x = s(2);
dx = diff(x, a);
dy = diff(y, a);
sx = subs(dx, a, 10^(-8))*10^(-8)/138207;
sy = subs(dy, a, 10^(-8))*10^(-8)/393090;

disp(['S(x, a) (maximum population) is ', num2str(double(sx))]);
disp(['S(y, a) (maximum population) is ', num2str(double(sy))]);

syms a
A = [a 0.05/150000; 0.08/400000 a];
b = [0.05; 0.08];
s = A\b;
y = s(1);
x = s(2);




solution_a = solve(x == 0, a);
disp(['Total population for the whales is maximized if blue whale is driven to extinction at a=', num2str(double(solution_a))]);

A = [18*10^(-8) 12*0.1/150000; 6*0.16/400000 18*10^(-8)];
b = [12*0.05; 6*0.08];
x = A\b;

disp(['The maximum profit is achieved at blue whale population at ', num2str(double(x(2)))]);
disp(['The maximum profit rate is achieved at fin whale population at ', num2str(double(x(1)))]);

%A population of 194703 Fin whales and 70619 Blue whales will result in the maximum revenue


syms r1

A = [18*10^(-8) 12*2*r1/150000; 6*2*0.08/400000 18*10^(-8)];
b = [12*r1; 6*0.08];
s = A\b;
y = s(1);
x = s(2);
dx = diff(x, r1);
dy = diff(y, r1);
sx = subs(dx, r1, 0.05)*0.05/70619;
sy = subs(dy, r1, 0.05)*0.05/194703;

disp(['S(x, r1) (maximum profit) is ', num2str(double(sx))]);
disp(['S(y, r1) (maximum profit) is ', num2str(double(sy))]);

syms r2

A = [18*10^(-8) 12*2*0.05/150000; 6*2*r2/400000 18*10^(-8)];
b = [12*0.05; 6*r2];
s = A\b;
y = s(1);
x = s(2);
dx = diff(x, r2);
dy = diff(y, r2);
sx = subs(dx, r2, 0.08)*0.08/70619;
sy = subs(dy, r2, 0.08)*0.08/194703;

disp(['S(x, r2) (maximum profit) is ', num2str(double(sx))]);
disp(['S(y, r2) (maximum profit) is ', num2str(double(sy))]);


syms k1

A = [18*10^(-8) 12*2*0.05/k1; 6*2*0.08/400000 18*10^(-8)];
b = [12*0.05; 6*0.08];
s = A\b;
y = s(1);
x = s(2);
dx = diff(x, k1);
dy = diff(y, k1);
sx = subs(dx, k1, 150000)*150000/70619;
sy = subs(dy, k1, 150000)*150000/194703;

disp(['S(x, k1) (maximum profit) is ', num2str(double(sx))]);
disp(['S(y, k1) (maximum profit) is ', num2str(double(sy))]);

syms k2

A = [18*10^(-8) 2*2*0.05/150000; 6*2*0.08/k2 18*10^(-8)];
b = [12*0.05; 6*0.08];
s = A\b;
y = s(1);
x = s(2);
dx = diff(x, k2);
dy = diff(y, k2);
sx = subs(dx, k2, 400000)*400000/70619;
sy = subs(dy, k2, 400000)*400000/194703;

disp(['S(x, k2) (maximum profit) is ', num2str(double(sx))]);
disp(['S(y, k2) (maximum profit) is ', num2str(double(sy))]);


syms a
A = [a 0.05/150000; 0.08/400000 a];
b = [0.05; 0.08];
s = A\b;
y = s(1);
x = s(2);
dx = diff(x, a);
dy = diff(y, a);
sx = subs(dx, a, 10^(-8))*10^(-8)/138207;
sy = subs(dy, a, 10^(-8))*10^(-8)/393090;

disp(['S(x, a) (maximum profit) is ', num2str(double(sx))]);
disp(['S(y, a) (maximum profit) is ', num2str(double(sy))]);


syms a

A = [18*a 12*2*0.05/150000; 6*2*0.08/400000 18*a];
b = [12*0.05; 6*0.08];
s = A\b;
y = s(1);
x = s(2);

solution_a = solve(x == 0, a);
disp(['total profit for the whales is maximized if blue whale is driven to extinction at a=', num2str(double(solution_a))]);

%Constraint: x=75000
%See if there is a max of y when x= 75000 that is within constraint
A = [18*10^(-8) 12*0.1/150000 1; 6*0.16/400000 18*10^(-8) 0; 0 1 0];
b = [12*0.05; 6*0.08; 75000];
x = A\b;
disp(['Constraint at x=75000: x=', num2str(double(x(2)))]);
disp(['Constraint at x=75000: y=', num2str(double(x(1)))]);
disp(['Constraint at x=75000: lambda=', num2str(double(x(3)))]);


%Constraint: y=200000
%See if there is a max o x when y=200000 that is within constraint
A2 = [18*10^(-8) 12*0.1/150000 0; 6*0.16/400000 18*10^(-8) 1; 1 0 0];
b2 = [12*0.05; 6*0.08; 200000];
x2 = A2\b2;
disp(['Constraint at y=200000: x=', num2str(double(x2(2)))]);
disp(['Constraint at y=200000: y=', num2str(double(x2(1)))]);
disp(['Constraint at y=200000: lambda=', num2str(double(x2(3)))]);
