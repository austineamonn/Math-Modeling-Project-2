% Parameters
r = [0.05, 0.08]; % Growth rates for blue and fin whales
K = [150000, 400000]; % Carrying capacities
alpha = 1e-8; % Competition coefficient
%quota = [218.7432, 2914.695]; % Whaling quota: blue whales, fin whales
quota = [0, 0];
% Initial populations
x = 4800; % Initial number of blue whales
y = 43000; % Initial number of fin whales

% Time settings
T = 1000; % Total time in years

% Initialize arrays to store population sizes
x_pop = zeros(1, T);
y_pop = zeros(1, T);

% Simulation loop
for t = 1:T
    % Calculate population changes without considering whaling quota
    dx = r(1) * x * (1 - x / K(1)) - alpha * x * y;
    dy = r(2) * y * (1 - y / K(2)) - alpha * x * y;
    
    % Update populations with growth and then subtract the quota
    x = max(0, x + dx - quota(1)); % Ensure population does not go below 0
    y = max(0, y + dy - quota(2)); % Ensure population does not go below 0
    
    % Store populations in arrays
    x_pop(t) = x;
    y_pop(t) = y;
end

% Plotting results
figure;
plot(1:T, x_pop, 'b', 1:T, y_pop, 'r');
xlabel('Time (years)');
ylabel('Population size');
legend('Blue Whales', 'Fin Whales');
title('Impact of Whaling Quotas on Whale Populations (Discrete Model)');
