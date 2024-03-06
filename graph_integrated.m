
%%%%%%Plot for dy/dt vs y%%%%%%

% Define the range of x
x = linspace(0, 400000, 1000); % Generates 1000 points between 0 and 138207

% Calculate the function values
y = 0.08.*x.*(1 - x/400000) - 10^(-8)*138207.*x;

% Plot the function
figure; % Creates a new figure window
plot(x, y, 'LineWidth', 10);
yline(0, '--', 'LineWidth', 2); % Horizontal line at y=0 with a thicker line, no legend needed
xlabel('Fin Whale Population', 'FontSize',14);
ylabel('Fin Whale Growth Rate', 'FontSize',14);
title('Plot of Fin Whale Growth Rate vs Fin Whale Population', 'FontSize',14);
grid on; % Adds a grid to the plot for better readability

% Prevent scientific notation on axes
ax = gca;
ax.FontSize = 14; % Larger font size for the axes
xticks = get(ax, 'XTick');
newXTickLabels = arrayfun(@(v) sprintf('%.0f', v), xticks, 'UniformOutput', false);
set(ax, 'XTickLabel', newXTickLabels);
yticks = get(ax, 'YTick');
newYTickLabels = arrayfun(@(v) sprintf('%.2f', v), yticks, 'UniformOutput', false);
set(ax, 'YTickLabel', newYTickLabels);

% Calculate the function value at x = 138207
x_point = 393089;
y_point = 0.08*x_point*(1 - x_point/400000) - 10^(-8)*138207*x_point;

% Plot the dot
hold on; % Keep the current plot
plot(x_point, y_point, 'r.', 'MarkerSize', 50); % Plot the dot in red with a larger size

% Label the point
label = sprintf('(%.0f, %.2f)', x_point, y_point);
text(x_point-4000, y_point, label, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'FontSize',14);

%%%%%%Plot for dx/dt vs x%%%%%%

% Define the range of x
x = linspace(0, 150000, 1000); % Generates 1000 points between 0 and 138207

% Calculate the function values
y = 0.05.*x.*(1 - x/150000) - 10^(-8)*393090.*x;

% Plot the function
figure; % Creates a new figure window
plot(x, y, 'LineWidth', 10);
yline(0, '--', 'LineWidth', 2); % Horizontal line at y=0 with a thicker line, no legend needed
xlabel('Blue Whale Population','FontSize',14);
ylabel('Blue Whale Growth Rate','FontSize',14);
title('Plot of Blue Whale Growth Rate vs Blue Whale Population','FontSize',14);
grid on; % Adds a grid to the plot for better readability

% Prevent scientific notation on axes
ax = gca;
ax.FontSize = 14; % Larger font size for the axes
xticks = get(ax, 'XTick');
newXTickLabels = arrayfun(@(v) sprintf('%.0f', v), xticks, 'UniformOutput', false);
set(ax, 'XTickLabel', newXTickLabels);
yticks = get(ax, 'YTick');
newYTickLabels = arrayfun(@(v) sprintf('%.2f', v), yticks, 'UniformOutput', false);
set(ax, 'YTickLabel', newYTickLabels);

% Calculate the function value at x = 138207
x_point = 138207;
y_point = 0.05*x_point*(1 - x_point/150000) - 10^(-8)*393090*x_point;

% Plot the dot
hold on; % Keep the current plot
plot(x_point, y_point, 'r.', 'MarkerSize', 50); % Plot the dot in red with a larger size

% Label the point
label = sprintf('(%.0f, %.2f)', x_point, y_point);
text(x_point-2000, y_point, label, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'FontSize',14);


%%%%%%Plot for populations that creates maximum growth rate vs alpha%%%%%%

syms a
A = [2*a 2*0.05/150000; 2*0.08/400000 2*a];
b = [0.05; 0.08];
s = A\b;
y = s(1);
x = s(2);

% Convert symbolic expressions to functions for numeric evaluation
x_func = matlabFunction(x);
y_func = matlabFunction(y);

% Define the range for a for numeric evaluation
a_values = linspace(0, 1.4*10^(-7), 1000);

% Evaluate dx and dy over the range of a_values
x_values = x_func(a_values);
y_values = y_func(a_values);

% Plot dx vs. dy over the range of a
figure; % Open a new figure window
h1 = plot(a_values, x_values, 'LineWidth', 10, 'DisplayName', 'Blue Whale Population'); % Save handle for x plot
hold on % Hold on to plot dy on the same graph
h2 = plot(a_values, y_values, 'LineWidth', 10, 'DisplayName', 'Fin Whale Population'); % Save handle for y plot
yline(0, '--', 'LineWidth', 2); % Horizontal line at y=0 with a thicker line, no legend needed
h3 = plot(1.25e-07, 0, 'y.', 'MarkerSize', 50, 'LineWidth', 2, 'DisplayName', 'Extinction threshold'); % Mark a specific point
h4 = plot(10^-8, 0, 'g.', 'MarkerSize', 50, 'LineWidth', 2,'DisplayName', 'IWC value'); % Mark a specific point
% Label the dot
text(1.35e-07, 0, '  1.25*10^{-7}', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'FontSize',14)
text(1.2*10^-8, 3000, '  10^{-8}', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'FontSize',14)


hold off

% Customize the axes and labels with larger font sizes
ax = gca; % Current axes
ax.FontSize = 14; % Larger font size for the axes
xlabel('Effect of Competition', 'FontSize', 16) % Larger font size for the x-axis label
ylabel('Population', 'FontSize', 16) % Larger font size for the y-axis label
title('Blue Whale and Fin Whale Populations vs. Effect of Competition', 'FontSize', 18) % Larger font size for the title

% Show legend 
legend([h1, h2, h3, h4], 'Location', 'best')

grid on % Add grid lines for better readability

% Solve for a when x is 0 and display
solution_a = solve(x == 0, a);
disp(['Total growth rate for the whales is maximized if blue whale is driven to extinction at a=', num2str(double(solution_a))]);

%%%%%%Plot for maximum population vs alpha%%%%%%

syms a
A = [a 0.05/150000; 0.08/400000 a];
b = [0.05; 0.08];
s = A\b;
y = s(1);
x = s(2);


% Convert symbolic expressions to functions for numeric evaluation
x_func = matlabFunction(x);
y_func = matlabFunction(y);

% Define the range for a for numeric evaluation
a_values = linspace(0, 1.4*10^(-7), 1000);

% Evaluate dx and dy over the range of a_values
x_values = x_func(a_values);
y_values = y_func(a_values);

% Plot dx vs. dy over the range of a
figure; % Open a new figure window
h1 = plot(a_values, x_values, 'LineWidth', 10, 'DisplayName', 'Blue Whale Population'); % Save handle for x plot
hold on % Hold on to plot dy on the same graph
h2 = plot(a_values, y_values, 'LineWidth', 10, 'DisplayName', 'Fin Whale Population'); % Save handle for y plot
yline(0, '--', 'LineWidth', 2); % Horizontal line at y=0 with a thicker line, no legend needed
h3 = plot(1.25e-07, 0, 'y.', 'MarkerSize', 50, 'LineWidth', 2, 'DisplayName', 'Extinction threshold'); % Mark a specific point
h4 = plot(10^-8, 0, 'g.', 'MarkerSize', 50, 'LineWidth', 2,'DisplayName', 'IWC value'); % Mark a specific point
% Label the dot
text(1.35e-07, 0, '  1.25*10^{-7}', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'FontSize',14)
text(1.2*10^-8, 3000, '  10^{-8}', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'FontSize',14)


hold off

% Customize the axes and labels with larger font sizes
ax = gca; % Current axes
ax.FontSize = 14; % Larger font size for the axes
xlabel('Effect of Competition', 'FontSize', 16) % Larger font size for the x-axis label
ylabel('Population', 'FontSize', 16) % Larger font size for the y-axis label
title('Blue Whale and Fin Whale Populations vs. Effect of Competition', 'FontSize', 18) % Larger font size for the title

% Show legend 
legend([h1, h2, h3, h4], 'Location', 'best')

grid on % Add grid lines for better readability

% Solve for a when x is 0 and display
solution_a = solve(x == 0, a);
disp(['Total population for the whales is maximized if blue whale is driven to extinction at a=', num2str(double(solution_a))]);


%%%%%%Plot for population that produces maximum revenue vs alpha%%%%%%

syms a

A = [18*a 12*2*0.05/150000; 6*2*0.08/400000 18*a];
b = [12*0.05; 6*0.08];
s = A\b;
y = s(1);
x = s(2);
% Convert symbolic expressions to functions for numeric evaluation
x_func = matlabFunction(x);
y_func = matlabFunction(y);

% Define the range for a for numeric evaluation
a_values = linspace(0, 2*10^(-7), 1000);

% Evaluate dx and dy over the range of a_values
x_values = x_func(a_values);
y_values = y_func(a_values);

% Plot dx vs. dy over the range of a
figure; % Open a new figure window
h1 = plot(a_values, x_values, 'LineWidth', 10, 'DisplayName', 'Blue Whale Population'); % Save handle for x plot
hold on % Hold on to plot dy on the same graph
h2 = plot(a_values, y_values, 'LineWidth', 10, 'DisplayName', 'Fin Whale Population'); % Save handle for y plot
yline(0, '--', 'LineWidth', 2); % Horizontal line at y=0 with a thicker line, no legend needed
h3 = plot(1.6667e-07, 0, 'y.', 'MarkerSize', 50, 'LineWidth', 2, 'DisplayName', 'Extinction threshold'); % Mark a specific point
h4 = plot(10^-8, 0, 'g.', 'MarkerSize', 50, 'LineWidth', 2,'DisplayName', 'IWC value'); % Mark a specific point
% Label the dot
text(1.8e-07, 0, '  1.6667*10^{-7}', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'FontSize',14)
text(1.2*10^-8, 3000, '  10^{-8}', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'FontSize',14)
hold off

% Customize the axes and labels with larger font sizes
ax = gca; % Current axes
ax.FontSize = 14; % Larger font size for the axes
xlabel('Effect of Competition', 'FontSize', 16) % Larger font size for the x-axis label
ylabel('Population', 'FontSize', 16) % Larger font size for the y-axis label
title('Blue Whale and Fin Whale Populations vs. Effect of Competition', 'FontSize', 18) % Larger font size for the title

% Show legend
legend([h1, h2,h3,h4], 'Location', 'best')

grid on % Add grid lines for better readability

% Solve for a when x is 0 and display
solution_a = solve(x == 0, a);
disp(['total growth rate for the whales is maximized if blue whale is driven to extinction at a=', num2str(double(solution_a))]);

