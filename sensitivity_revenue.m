syms x y r1
profit = 12000*(r1*x*(1-x/150000)-10^(-8)*x*y)+6000*(0.08*y*(1-y/400000)-10^(-8)*x*y);
dp = diff(profit, r1);

% Assign values to x, y, and r1
x_val = 70619; % Example value for x
y_val = 194703; % Example value for y
r1_val = 0.05; % Example value for r1

% Substitute the values of x, y, and r1 into the differentiated expression
dp_val = subs(dp, [x, y, r1], [x_val, y_val, r1_val]);
sp = dp_val*0.05/67908000;
disp(['S(Revenue, r1) is ', num2str(double(sp))]);

syms x y r2
profit = 12000*(0.05*x*(1-x/150000)-10^(-8)*x*y)+6000*(r2*y*(1-y/400000)-10^(-8)*x*y);
dp = diff(profit, r2);

% Assign values to x, y, and r1
x_val = 70619; % Example value for x
y_val = 194703; % Example value for y
r2_val = 0.08; % Example value for r1

% Substitute the values of x, y, and r1 into the differentiated expression
dp_val = subs(dp, [x, y, r2], [x_val, y_val, r2_val]);
sp = dp_val*0.08/67908000;
disp(['S(Revenue, r2) is ', num2str(double(sp))]);

syms x y k1
profit = 12000*(0.05*x*(1-x/k1)-10^(-8)*x*y)+6000*(0.08*y*(1-y/400000)-10^(-8)*x*y);
dp = diff(profit, k1);

% Assign values to x, y, and r1
x_val = 70619; % Example value for x
y_val = 194703; % Example value for y
k1_val = 150000; % Example value for r1

% Substitute the values of x, y, and r1 into the differentiated expression
dp_val = subs(dp, [x, y, k1], [x_val, y_val, k1_val]);
sp = dp_val*150000/67908000;
disp(['S(Revenue, k1) is ', num2str(double(sp))]);


syms x y k2
profit = 12000*(0.05*x*(1-x/150000)-10^(-8)*x*y)+6000*(0.08*y*(1-y/k2)-10^(-8)*x*y);
dp = diff(profit, k2);

% Assign values to x, y, and r1
x_val = 70619; % Example value for x
y_val = 194703; % Example value for y
k2_val = 400000; % Example value for r1

% Substitute the values of x, y, and r1 into the differentiated expression
dp_val = subs(dp, [x, y, k2], [x_val, y_val, k2_val]);
sp = dp_val*400000/67908000;
disp(['S(Revenue, k2) is ', num2str(double(sp))]);


syms x y a
profit = 12000*(0.05*x*(1-x/150000)-a*x*y)+6000*(0.08*y*(1-y/400000)-a*x*y);
dp = diff(profit, a);

% Assign values to x, y, and r1
x_val = 70619; % Example value for x
y_val = 194703; % Example value for y
a_val = 10^(-8); % Example value for r1

% Substitute the values of x, y, and r1 into the differentiated expression
dp_val = subs(dp, [x, y, a], [x_val, y_val, a_val]);
sp = dp_val*10^(-8)/67908000;
disp(['S(Revenue, a) is ', num2str(double(sp))]);
