%%%%%Max growth rate population calculation%%%%%

A_g = [2*10^(-8) 0.1/150000; 0.16/400000 2*10^(-8)]; %Represent system of equations as matrix
b_g = [0.05; 0.08];
x_g = A_g\b_g; %Solve x and y

disp(['The maximum growth rate is achieved at blue whale population at ', num2str(double(x_g(2)))]);
disp(['The maximum growth rate is achieved at fin whale population at ', num2str(double(x_g(1)))]);

%%%%%Sensitivity calculations (max growth rate)_%%%%%
syms r1
A = [2*10^(-8) 2*r1/150000; 0.16/400000 2*10^(-8)]; %Represent system of equations as matrix
b = [r1; 0.08];
s = A\b;
y = s(1);% Isolate y
x = s(2);% Isolate x
dx = diff(x, r1); %Take derivative with respect to the parameters
dy = diff(y, r1);
sx = subs(dx, r1, 0.05)*0.05/69103; %Calculate sensitivity for x
sy = subs(dy, r1, 0.05)*0.05/196545; %Calculate sensitivity for y

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
sy = subs(dy, k1, 150000)*150000/196544;

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
sy = subs(dy, k2, 400000)*400000/196544;

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
sy = subs(dy, a, 10^(-8))*10^(-8)/196544;

disp(['S(x, a) (maximum growth rate) is ', num2str(double(sx))]);
disp(['S(y, a) (maximum growth rate) is ', num2str(double(sy))]);

%%%%%Sensitivity for max growth rate%%%%%
syms x y r1
growth = (r1*x*(1-x/150000)-10^(-8)*x*y)+(0.08*y*(1-y/400000)-10^(-8)*x*y);
dp = diff(growth, r1);

% Assign values to x, y, and r1
x_val = 69103; % Value for x
y_val = 196544; % Value for y
r1_val = 0.05; % Value for r1

% Substitute the values of x, y, and r1 into the differentiated expression
dp_val = subs(dp, [x, y, r1], [x_val, y_val, r1_val]);
sp = dp_val*0.05/9589;
disp(['S(Max growth rate, r1) is ', num2str(double(sp))]);

syms x y r2
growth = (0.05*x*(1-x/150000)-10^(-8)*x*y)+(r2*y*(1-y/400000)-10^(-8)*x*y);
dp = diff(growth, r2);

% Assign values to x, y, and r1
x_val = 69103; % Value for x
y_val = 196544; % Value for y
r2_val = 0.08; % Value for r1

% Substitute the values of x, y, and r1 into the differentiated expression
dp_val = subs(dp, [x, y, r2], [x_val, y_val, r2_val]);
sp = dp_val*0.08/9589;
disp(['S(Max growth rate, r2) is ', num2str(double(sp))]);

syms x y k1
growth = (0.05*x*(1-x/k1)-10^(-8)*x*y)+(0.08*y*(1-y/400000)-10^(-8)*x*y);
dp = diff(growth, k1);

% Assign values to x, y, and r1
x_val = 69103; % Value for x
y_val = 196544; % Value for y
k1_val = 150000; % value for r1

% Substitute the values of x, y, and r1 into the differentiated expression
dp_val = subs(dp, [x, y, k1], [x_val, y_val, k1_val]);
sp = dp_val*150000/9589;
disp(['S(Max growth rate, k1) is ', num2str(double(sp))]);


syms x y k2
growth = (0.05*x*(1-x/150000)-10^(-8)*x*y)+(0.08*y*(1-y/k2)-10^(-8)*x*y);
dp = diff(growth, k2);

% Assign values to x, y, and r1
x_val = 69104; % Value for x
y_val = 196540; % Value for y
k2_val = 400000; % Value for r1

% Substitute the values of x, y, and r1 into the differentiated expression
dp_val = subs(dp, [x, y, k2], [x_val, y_val, k2_val]);
sp = dp_val*400000/9589;
disp(['S(Max growth rate, k2) is ', num2str(double(sp))]);


syms x y a
growth = (0.05*x*(1-x/150000)-a*x*y)+(0.08*y*(1-y/400000)-a*x*y);
dp = diff(growth, a);

% Assign values to x, y, and r1
x_val = 69103; % Value for x
y_val = 196544; % Value for y
a_val = 10^(-8); % Value for r1

% Substitute the values of x, y, and r1 into the differentiated expression
dp_val = subs(dp, [x, y, a], [x_val, y_val, a_val]);
sp = dp_val*10^(-8)/9589;
disp(['S(Max growth rate, a) is ', num2str(double(sp))]);

%%%%%Calculate the alpha that one species's extinction will result max growth rate%%%%%
syms a
A = [2*a 2*0.05/150000; 2*0.08/400000 2*a];
b = [0.05; 0.08];
s = A\b;
y = s(1);
x = s(2);


solution_a = solve(x == 0, a);
disp(['total growth rate for the whales is maximized if blue whale is driven to extinction at a=', num2str(double(solution_a))]);

%%%%%Max population calculation%%%%%
A = [10^(-8) 0.05/150000; 0.08/400000 10^(-8)];
b = [0.05; 0.08];
x = A\b;

disp(['The maximum population is achieved at blue whale population at ', num2str(double(x(2)))]);
disp(['The maximum population is achieved at fin whale population at ', num2str(double(x(1)))]);

%%%%%Sensitivities Calculation (Population)%%%%%
syms r1
A = [10^(-8) r1/150000; 0.08/400000 10^(-8)];
b = [r1; 0.08];
s = A\b;
y = s(1);
x = s(2);
z = x+y;
dx = diff(x, r1);
dy = diff(y, r1);
dz = diff(z, r1);
sx = subs(dx, r1, 0.05)*0.05/138207;
sy = subs(dy, r1, 0.05)*0.05/393090;
sz = subs(dz, r1, 0.05)*0.05/(138207+393090);

disp(['S(x, r1) (maximum population) is ', num2str(double(sx))]);
disp(['S(y, r1) (maximum population) is ', num2str(double(sy))]);
disp(['S(Max Population, r1) is ', num2str(double(sz))]);


syms r2
A = [10^(-8) 0.05/150000; r2/400000 10^(-8)];
b = [0.05; r2];
s = A\b;
y = s(1);
x = s(2);
z= x+y;
dx = diff(x, r2);
dy = diff(y, r2);
dz = diff(z, r2);
sx = subs(dx, r2, 0.08)*0.08/138207;
sy = subs(dy, r2, 0.08)*0.08/393090;
sz = subs(dz, r2, 0.08)*0.08/(138207+393090);

disp(['S(x, r2) (maximum population) is ', num2str(double(sx))]);
disp(['S(y, r2) (maximum population) is ', num2str(double(sy))]);
disp(['S(Maximum Population, r2) is ', num2str(double(sz))]);


syms k1
A = [10^(-8) 0.05/k1; 0.08/400000 10^(-8)];
b = [0.05; 0.08];
s = A\b;
y = s(1);
x = s(2);
z = y+x;
dx = diff(x, k1);
dy = diff(y, k1);
dz =  diff(z, k1);
sx = subs(dx, k1, 150000)*150000/138207;
sy = subs(dy, k1, 150000)*150000/393090;
sz = subs(dz, k1, 150000)*150000/(138207+393090);

disp(['S(x, k1) (maximum population) is ', num2str(double(sx))]);
disp(['S(y, k1) (maximum population)is ', num2str(double(sy))]);
disp(['S(Maximum Population, k1) is ', num2str(double(sz))]);

syms k2
A = [10^(-8) 0.05/150000; 0.08/k2 10^(-8)];
b = [0.05; 0.08];
s = A\b;
y = s(1);
x = s(2);
z=y+x;
dx = diff(x, k2);
dy = diff(y, k2);
dz = diff(z, k2);
sx = subs(dx, k2, 400000)*400000/138207;
sy = subs(dy, k2, 400000)*400000/393090;
sz = subs(dz, k2, 400000)*400000/(138207+393090);

disp(['S(x, k2) (maximum population) is ', num2str(double(sx))]);
disp(['S(y, k2) (maximum population) is ', num2str(double(sy))]);
disp(['S(Maximum Population, k2) is ', num2str(double(sz))]);

syms a
A = [a 0.05/150000; 0.08/400000 a];
b = [0.05; 0.08];
s = A\b;
y = s(1);
x = s(2);
z=y+x;
dx = diff(x, a);
dy = diff(y, a);
dz = diff(z, a);
sx = subs(dx, a, 10^(-8))*10^(-8)/138207;
sy = subs(dy, a, 10^(-8))*10^(-8)/393090;
sz = subs(dz, a, 10^(-8))*10^(-8)/(138207+393090);


disp(['S(x, a) (maximum population) is ', num2str(double(sx))]);
disp(['S(y, a) (maximum population) is ', num2str(double(sy))]);
disp(['S(Maximum Population, a) is ', num2str(double(sz))]);

%%%%%Calculate the alpha that one species's extinction will result max total population%%%%%
syms a
A = [a 0.05/150000; 0.08/400000 a];
b = [0.05; 0.08];
s = A\b;
y = s(1);
x = s(2);


solution_a = solve(x == 0, a);
disp(['Total population for the whales is maximized if blue whale is driven to extinction at a=', num2str(double(solution_a))]);

%%%%%Max revenue calculation%%%%%
A = [18*10^(-8) 12*0.1/150000; 6*0.16/400000 18*10^(-8)];
b = [12*0.05; 6*0.08];
x = A\b;

disp(['The maximum profit is achieved at blue whale population at ', num2str(double(x(2)))]);
disp(['The maximum profit rate is achieved at fin whale population at ', num2str(double(x(1)))]);

%%%%%Sensitivity calculations (max revenue)%%%%%
syms r1

A = [18000*10^(-8) 12000*2*r1/150000; 6000*2*0.08/400000 18000*10^(-8)];
b = [12000*r1; 6000*0.08];
s = A\b;
y = s(1);
x = s(2);
dx = diff(x, r1);
dy = diff(y, r1);
sx = subs(dx, r1, 0.05)*0.05/70619;
sy = subs(dy, r1, 0.05)*0.05/194703;

disp(['S(x, r1) (maximum revenue) is ', num2str(double(sx))]);
disp(['S(y, r1) (maximum revenue) is ', num2str(double(sy))]);

syms r2

A = [18000*10^(-8) 12000*2*0.05/150000; 6000*2*r2/400000 18000*10^(-8)];
b = [12000*0.05; 6000*r2];
s = A\b;
y = s(1);
x = s(2);
dx = diff(x, r2);
dy = diff(y, r2);
sx = subs(dx, r2, 0.08)*0.08/70619;
sy = subs(dy, r2, 0.08)*0.08/194703;

disp(['S(x, r2) (maximum revenue) is ', num2str(double(sx))]);
disp(['S(y, r2) (maximum revenue) is ', num2str(double(sy))]);


syms k1

A = [18000*10^(-8) 12000*2*0.05/k1; 6000*2*0.08/400000 18000*10^(-8)];
b = [12000*0.05; 6000*0.08];
s = A\b;
y = s(1);
x = s(2);
dx = diff(x, k1);
dy = diff(y, k1);
sx = subs(dx, k1, 150000)*150000/70619;
sy = subs(dy, k1, 150000)*150000/194703;

disp(['S(x, k1) (maximum revenue) is ', num2str(double(sx))]);
disp(['S(y, k1) (maximum revenue) is ', num2str(double(sy))]);

syms k2

A = [18000*10^(-8) 12000*2*0.05/150000; 6000*2*0.08/k2 18000*10^(-8)];
b = [12000*0.05; 6000*0.08];
s = A\b;
y = s(1);
x = s(2);
dx = diff(x, k2);
dy = diff(y, k2);
sx = subs(dx, k2, 400000)*400000/70619;
sy = subs(dy, k2, 400000)*400000/194703;

disp(['S(x, k2) (maximum revenue) is ', num2str(double(sx))]);
disp(['S(y, k2) (maximum revenue) is ', num2str(double(sy))]);


syms a

A = [18000*a 12000*2*0.05/150000; 6000*2*0.08/400000 18000*a];
b = [12000*0.05; 6000*0.08];
s = A\b;
y = s(1);
x = s(2);
dx = diff(x, a);
dy = diff(y, a);
sx = subs(dx, a, 10^(-8))*10^(-8)/70619;
sy = subs(dy, a, 10^(-8))*10^(-8)/194703;

disp(['S(x, a) (maximum revenue) is ', num2str(double(sx))]);
disp(['S(y, a) (maximum revenue) is ', num2str(double(sy))]);
%%%%%Sensitivity calculation for max revenue%%%%%
syms x y r1
profit = 12000*(r1*x*(1-x/150000)-10^(-8)*x*y)+6000*(0.08*y*(1-y/400000)-10^(-8)*x*y);
dp = diff(profit, r1);

% Assign values to x, y, and r1
x_val = 70619; % Value for x
y_val = 194703; % Value for y
r1_val = 0.05; % Value for r1

% Substitute the values of x, y, and r1 into the differentiated expression
dp_val = subs(dp, [x, y, r1], [x_val, y_val, r1_val]);
sp = dp_val*0.05/67908000;
disp(['S(Revenue, r1) is ', num2str(double(sp))]);

syms x y r2
profit = 12000*(0.05*x*(1-x/150000)-10^(-8)*x*y)+6000*(r2*y*(1-y/400000)-10^(-8)*x*y);
dp = diff(profit, r2);

% Assign values to x, y, and r1
x_val = 70619; % Value for x
y_val = 194703; % Value for y
r2_val = 0.08; % Value for r1

% Substitute the values of x, y, and r1 into the differentiated expression
dp_val = subs(dp, [x, y, r2], [x_val, y_val, r2_val]);
sp = dp_val*0.08/67908000;
disp(['S(Revenue, r2) is ', num2str(double(sp))]);

syms x y k1
profit = 12000*(0.05*x*(1-x/k1)-10^(-8)*x*y)+6000*(0.08*y*(1-y/400000)-10^(-8)*x*y);
dp = diff(profit, k1);

% Assign values to x, y, and r1
x_val = 70619; % Value for x
y_val = 194703; % Value for y
k1_val = 150000; % Value for r1

% Substitute the values of x, y, and r1 into the differentiated expression
dp_val = subs(dp, [x, y, k1], [x_val, y_val, k1_val]);
sp = dp_val*150000/67908000;
disp(['S(Revenue, k1) is ', num2str(double(sp))]);


syms x y k2
profit = 12000*(0.05*x*(1-x/150000)-10^(-8)*x*y)+6000*(0.08*y*(1-y/k2)-10^(-8)*x*y);
dp = diff(profit, k2);

% Assign values to x, y, and r1
x_val = 70619; % Value for x
y_val = 194703; % Value for y
k2_val = 400000; % Value for r1

% Substitute the values of x, y, and r1 into the differentiated expression
dp_val = subs(dp, [x, y, k2], [x_val, y_val, k2_val]);
sp = dp_val*400000/67908000;
disp(['S(Revenue, k2) is ', num2str(double(sp))]);


syms x y a
profit = 12000*(0.05*x*(1-x/150000)-a*x*y)+6000*(0.08*y*(1-y/400000)-a*x*y);
dp = diff(profit, a);

% Assign values to x, y, and r1
x_val = 70619; % Value for x
y_val = 194703; % Value for y
a_val = 10^(-8); % Value for r1

% Substitute the values of x, y, and r1 into the differentiated expression
dp_val = subs(dp, [x, y, a], [x_val, y_val, a_val]);
sp = dp_val*10^(-8)/67908000;
disp(['S(Revenue, a) is ', num2str(double(sp))]);

%%%%%Calculate the alpha that one species's extinction will result max revenue%%%%%
syms a

A = [18*a 12*2*0.05/150000; 6*2*0.08/400000 18*a];
b = [12*0.05; 6*0.08];
s = A\b;
y = s(1);
x = s(2);

solution_a = solve(x == 0, a);
disp(['total profit for the whales is maximized if blue whale is driven to extinction at a=', num2str(double(solution_a))]);

%%%%%Solve optimization problem with constraint

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




