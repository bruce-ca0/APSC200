function d = density_map(x,y,t)
%{
Let "n" be the length of the grid.

--- Inputs ---
x, y: n by n meshgrid of x and y coordinates
   t: time  

--- Outputs ---
d: n by n meshgrid of densities.  All densities must be on [0,inf)
%}

% Initialize density, x-center, y-center, and standard deviations
density_0 = 1; 
x0 = 0 + t^(1/2); 
y0 = 0 - t^(1/2);
std_x = 10;
std_y = 10;

% time dependent speed
spread_rate_x = 1.0;
spread_rate_y = 1.7;
std_x_t = std_x + spread_rate_x * sqrt(t);
std_y_t = std_y + spread_rate_y * sqrt(t);
density_0_t = density_0 - (spread_rate_y+spread_rate_x)/6 * t^(1/20);

% Guassian distrbution formula depedent on time. That is, the standard
% deviation grows with time, incresing the distrbution
d = density_0_t * exp(-((x-x0).^2)/ (2*std_x_t^2) + (-(y-y0).^2 / (2*std_y_t^2)));

% Ensure all values are greater than 0
d(d<0) = 0;
end