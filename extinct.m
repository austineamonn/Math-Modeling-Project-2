%Set alpha to be variable
syms a
% derivative of the growth rate functions and set gradient to 0 to find max
% r1 - 2*r1*x/K1 − 2αy=0
% r2 - 2*r2*y/k2 - 2αx=0
%Plugin value below except α we have the following:
A = [2*a 2*0.05/150000; 2*0.08/400000 2*a];
b = [0.05; 0.08];
s = A\b
y = s(1)
x = s(2)

% Convert symbolic expressions to functions for numeric evaluation
x_func = matlabFunction(x);
y_func = matlabFunction(y);

% Define the range for a for numeric evaluation
a_values = linspace(0, 1.4*10^(-7), 1000);

% Evaluate dx and dy over the range of a_values
x_values = x_func(a_values);
y_values = y_func(a_values);

% Plot dx vs. dy over the range of a
plot(a_values, x_values, 'DisplayName', 'x')
hold on % Hold on to plot dy on the same graph
plot(a_values, y_values, 'DisplayName', 'y')
hold off

xlabel('a') % Label for the x-axis
ylabel('Count') % Label for the y-axis
title('X and Y vs. a') % Title for the plot
legend show % Show legend
grid on % Add grid lines for better readability


solution_a = solve(x == 0, a);
disp(['total growth rate for the whales is maximized if blue whale is driven to extinction at a=', num2str(double(solution_a))]);
