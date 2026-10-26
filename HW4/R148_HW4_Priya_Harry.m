%% R148_HW4_Priya_Harry.m
% Complete Solutions for Practice Problems 2.10 - 2.21
clear;
clc;

%% Problem 2.10
% Parallel RLC Circuit Response Parameter s
% s = -1/(2*R*C) +/- sqrt((1/(2*R*C))^2 - 1/(L*C))

% Problem 2.10 (a)
C_2_10 = 1e-6;   % Capacitance in Farads (1 uF)
L_2_10 = 0.64;   % Inductance in Henries (0.64 H)
R_2_10a = 200;   % Resistance in Ohms (200 Ohms)

alpha_2_10a = 1 / (2 * R_2_10a * C_2_10);
omega0_sq_2_10a = 1 / (L_2_10 * C_2_10);
disc_2_10a = alpha_2_10a^2 - omega0_sq_2_10a;

s1_2_10a = -alpha_2_10a + sqrt(disc_2_10a);
s2_2_10a = -alpha_2_10a - sqrt(disc_2_10a);

fprintf('--- Problem 2.10 ---\n');
fprintf('(a) For R = 200 Ohms:\n');
fprintf('    s1 = %.4g s^-1\n', s1_2_10a);
fprintf('    s2 = %.4g s^-1\n', s2_2_10a);

% Problem 2.10 (b)
% Range from 100 to 1000 Ohms to evaluate behavior
R_vec_2_10 = linspace(100, 1000, 10);
alpha_vec_2_10 = 1 ./ (2 .* R_vec_2_10 .* C_2_10);
disc_vec_2_10 = alpha_vec_2_10.^2 - omega0_sq_2_10a;

% A pure real value requires discriminant >= 0 (critically damped or overdamped)
% (1/(2*R*C))^2 >= 1/(L*C) => R <= sqrt(L / (4*C))
R_crit_2_10 = sqrt(L_2_10 / (4 * C_2_10));

fprintf('(b) Critical resistance yielding pure real s: R <= %.3g Ohms (exact: 400 Ohms).\n', R_crit_2_10);
fprintf('    Effect of decreasing R: As R decreases below 400 Ohms, the circuit becomes overdamped,\n');
fprintf('    the discriminant becomes positive, and s yields two distinct real negative values.\n\n');


%% Problem 2.11
% Annual CO2 emissions based on 19.4 lbs CO2/gal and 12,000 miles/year
miles_per_year = 12000;       % miles/year
co2_per_gallon = 19.4;        % lbs CO2/gallon

% Representative vehicle types and combined mpg estimates:
vehicle_names = {'Compact Hybrid', 'Midsize Sedan', 'Small SUV', 'Standard Pickup'};
vehicle_mpg = [52, 32, 28, 20]; % miles per gallon

annual_emissions = (miles_per_year ./ vehicle_mpg) .* co2_per_gallon; % lbs CO2

fprintf('--- Problem 2.11 ---\n');
fprintf('Annual CO2 emissions for 12,000 miles driven:\n');
for idx = 1:length(vehicle_mpg)
    fprintf('  %-16s (%2d mpg): %.4g lbs CO2\n', vehicle_names{idx}, vehicle_mpg(idx), annual_emissions(idx));
end
fprintf('\n');


%% Problem 2.12
% Vector creation exercises
fprintf('--- Problem 2.12 ---\n');

% (a) Evenly spaced vector from 1 to 20 in increments of 1
vec_2_12a = 1:1:20;
fprintf('(a) Vector 1 to 20 (step 1): First 3 values: %.4g, %.4g, %.4g ... Last: %.3g\n', ...
    vec_2_12a(1), vec_2_12a(2), vec_2_12a(3), vec_2_12a(end));

% (b) Vector from 0 to 2 in increments of pi/10
vec_2_12b = 0:(pi/10):2;
fprintf('(b) Vector 0 to 2 (step pi/10):\n    ');
fprintf('%.3g  ', vec_2_12b);
fprintf('\n');

% (c) 15 evenly spaced values between 4 and 20
vec_2_12c = linspace(4, 20, 15);
fprintf('(c) 15 values between 4 and 20:\n    ');
fprintf('%.3g  ', vec_2_12c);
fprintf('\n');

% (d) 10 values logarithmically spaced between 10 and 1000
vec_2_12d = logspace(1, 3, 10);
fprintf('(d) 10 logarithmically spaced values between 10 and 1000:\n    ');
fprintf('%.4g  ', vec_2_12d);
fprintf('\n\n');


%% Problem 2.13
% Unit conversion tables
fprintf('--- Problem 2.13 ---\n');

% (a) Feet to meters (0 to 10 ft, step 1; 1 ft = 0.3048 m)
ft_vec = (0:10)';
meters_vec = ft_vec .* 0.3048;
fprintf('(a) Feet to Meters:\n    Feet   Meters\n');
for i = 1:length(ft_vec)
    fprintf('    %4.0f   %.3g m\n', ft_vec(i), meters_vec(i));
end

% (b) Radians to degrees (0 to pi radians, step 0.1 rad)
rad_vec = (0:0.1:pi)';
deg_vec = rad_vec .* (180 / pi);
fprintf('\n(b) Radians to Degrees (sample first 5 rows):\n   Radians   Degrees\n');
for i = 1:5
    fprintf('    %5.1f    %.3g deg\n', rad_vec(i), deg_vec(i));
end

% (c) mi/h to ft/s (0 to 100 mi/h, 15 values; 1 mph = 5280/3600 ft/s)
mph_vec = linspace(0, 100, 15)';
fps_vec = mph_vec .* (5280 / 3600);
fprintf('\n(c) mi/h to ft/s (sample first 5 rows):\n    mi/h    ft/s\n');
for i = 1:5
    fprintf('    %5.1f   %.3g ft/s\n', mph_vec(i), fps_vec(i));
end

% (d) Hydronium ion concentration to pH (10 log spaced values from 0.001 to 1 mol/L)
H_conc = logspace(-3, 0, 10)';
pH_vals = -log10(H_conc);
fprintf('\n(d) Hydronium Ion Concentration to pH:\n   [H+] (mol/L)     pH\n');
for i = 1:length(H_conc)
    fprintf('    %10.4g     %.3g\n', H_conc(i), pH_vals(i));
end
fprintf('\n');


%% Problem 2.14
% Distance traveled by freely falling body: d = 0.5 * g * t^2
g_accel = 9.8;                     % acceleration due to gravity in m/s^2
time_vec_2_14 = (0:10:100)';       % Time from 0 to 100 s in increments of 10 s
dist_fallen = 0.5 .* g_accel .* (time_vec_2_14.^2); % Distance in meters

fprintf('--- Problem 2.14 ---\n');
fprintf('Free-fall Time vs Distance (g = 9.8 m/s^2):\n');
fprintf('   Time (s)   Distance (m)\n');
for i = 1:length(time_vec_2_14)
    fprintf('    %5.0f     %.4g m\n', time_vec_2_14(i), dist_fallen(i));
end
fprintf('\n');


%% Problem 2.15
% Power dissipation in a uniform wire: P = I^2 * rho * (l / A)
wire_diam = 0.001;                 % diameter in meters
wire_len = 2.00;                   % length in meters
wire_current = 120;                % current in amperes
wire_area = pi * (wire_diam / 2)^2; % cross-sectional area in m^2

mat_names = {'Silver', 'Copper', 'Gold', 'Aluminum', 'Iron'};
% Resistivities in ohm-meters
mat_resistivity = [1.59e-8, 1.68e-8, 2.44e-8, 2.82e-8, 1.00e-7];

wire_resistance = mat_resistivity .* (wire_len / wire_area);
power_dissipated = (wire_current^2) .* wire_resistance;

fprintf('--- Problem 2.15 ---\n');
fprintf('Power dissipated in 2.0 m wire (d = 0.001 m, I = 120 A):\n');
for i = 1:length(mat_names)
    fprintf('  %-10s: %.4g W\n', mat_names{i}, power_dissipated(i));
end
fprintf('\n');


%% Problem 2.16
% Power dissipation for 10 log-spaced lengths from 1 m to 1000 m (1 km)
lengths_vec_2_16 = logspace(0, 3, 10); % 1 m to 1000 m

% Copper wire as standard demonstration material
copper_rho = 1.68e-8;
copper_resistance_vec = copper_rho .* (lengths_vec_2_16 ./ wire_area);
copper_power_vec = (wire_current^2) .* copper_resistance_vec;

fprintf('--- Problem 2.16 ---\n');
fprintf('Power dissipated in Copper wire for 10 log-spaced lengths:\n');
fprintf('   Length (m)     Power (W)\n');
for i = 1:length(lengths_vec_2_16)
    fprintf('    %8.4g      %.4g W\n', lengths_vec_2_16(i), copper_power_vec(i));
end
fprintf('\n');


%% Problem 2.17
% Newton's Law of Universal Gravitation: F = G * m1 * m2 / r^2
G_const = 6.673e-11;  % N m^2 / kg^2
m_earth = 6.0e24;     % mass of Earth in kg
m_moon = 7.4e22;      % mass of Moon in kg
r_earth_moon = 3.9e8; % average distance in meters

F_grav = G_const * (m_earth * m_moon) / (r_earth_moon^2);

fprintf('--- Problem 2.17 ---\n');
fprintf('Gravitational force between Earth and Moon: %.4g N\n\n', F_grav);


%% Problem 2.18
% Gravitational force for 10 distances between 3.8e8 m and 4.0e8 m
r_distances = linspace(3.8e8, 4.0e8, 10);
F_distances = G_const .* (m_earth * m_moon) ./ (r_distances.^2);

fprintf('--- Problem 2.18 ---\n');
fprintf('Gravitational force across varying Earth-Moon distances:\n');
fprintf('   Distance (m)      Force (N)\n');
for i = 1:length(r_distances)
    fprintf('    %.3g m      %.4g N\n', r_distances(i), F_distances(i));
end
fprintf('\n');


%% Problem 2.19
% Ideal Gas Law and Van der Waals Equation
% Ideal: T = (P * V) / (n * R)
% Van der Waals: T = ((P + n^2*a / V^2) * (V - n*b)) / (n * R)

% Parameters for 1 mole of water vapor (steam):
n_mol = 1;                     % 1 mole
R_gas = 0.0831446;             % L*bar / (mol*K)
a_vdw = 5.536;                 % L^2*bar / mol^2 (for water vapor)
b_vdw = 0.03049;               % L / mol (for water vapor)

fprintf('--- Problem 2.19 ---\n');

% Problem 2.19 (a): 10 pressures from 0 to 400 bar for V = 1 L
P_vec_2_19a = linspace(0, 400, 10); % bar
V_fixed_2_19a = 1.0;                % L

T_ideal_2_19a = (P_vec_2_19a .* V_fixed_2_19a) ./ (n_mol * R_gas);
T_vdw_2_19a = ((P_vec_2_19a + (n_mol^2 * a_vdw) / (V_fixed_2_19a^2)) .* (V_fixed_2_19a - n_mol * b_vdw)) ./ (n_mol * R_gas);

fprintf('(a) Temperature for 10 pressures (0 to 400 bar) at V = 1.0 L (sample 3 values):\n');
fprintf('    P = %5.1f bar -> T_ideal = %.4g K, T_vdw = %.4g K\n', P_vec_2_19a(1), T_ideal_2_19a(1), T_vdw_2_19a(1));
fprintf('    P = %5.1f bar -> T_ideal = %.4g K, T_vdw = %.4g K\n', P_vec_2_19a(5), T_ideal_2_19a(5), T_vdw_2_19a(5));
fprintf('    P = %5.1f bar -> T_ideal = %.4g K, T_vdw = %.4g K\n', P_vec_2_19a(10), T_ideal_2_19a(10), T_vdw_2_19a(10));

% Problem 2.19 (b): 10 volumes from 0.1 L to 10 L for P = 220 bar
V_vec_2_19b = linspace(0.1, 10, 10); % L
P_fixed_2_19b = 220;                 % bar

T_ideal_2_19b = (P_fixed_2_19b .* V_vec_2_19b) ./ (n_mol * R_gas);
T_vdw_2_19b = ((P_fixed_2_19b + (n_mol^2 .* a_vdw) ./ (V_vec_2_19b.^2)) .* (V_vec_2_19b - n_mol * b_vdw)) ./ (n_mol * R_gas);

fprintf('\n(b) Temperature for 10 volumes (0.1 to 10 L) at P = 220 bar (sample 3 values):\n');
fprintf('    V = %5.2f L   -> T_ideal = %.4g K, T_vdw = %.4g K\n', V_vec_2_19b(1), T_ideal_2_19b(1), T_vdw_2_19b(1));
fprintf('    V = %5.2f L   -> T_ideal = %.4g K, T_vdw = %.4g K\n', V_vec_2_19b(5), T_ideal_2_19b(5), T_vdw_2_19b(5));
fprintf('    V = %5.2f L   -> T_ideal = %.4g K, T_vdw = %.4g K\n\n', V_vec_2_19b(10), T_ideal_2_19b(10), T_vdw_2_19b(10));


%% Problem 2.20
% Built-in format display options for a = [-1/3, 0, 1/3, 2/3]
fprintf('--- Problem 2.20 ---\n');
a = [-1/3, 0, 1/3, 2/3];

disp('format short:'); format short; disp(a);
disp('format long:'); format long; disp(a);
disp('format bank:'); format bank; disp(a);
disp('format short e:'); format short e; disp(a);
disp('format long e:'); format long e; disp(a);
disp('format short eng:'); format short eng; disp(a);
disp('format long eng:'); format long eng; disp(a);
disp('format short g:'); format short g; disp(a);
disp('format long g:'); format long g; disp(a);
disp('format +:'); format +; disp(a);
disp('format rat:'); format rat; disp(a);

% Reset back to standard default format
format short;


%% Problem 2.21
% Saving and Loading workspace data
deg_vals = (0:30:180)';
rad_vals = deg_vals .* (pi / 180);
D_to_R = [deg_vals, rad_vals];

% Save the 2-column array to an ASCII data file
save degrees.dat D_to_R -ascii;

% Clear workspace variable and load data back into MATLAB
clear D_to_R;
loaded_data = load('degrees.dat');

fprintf('--- Problem 2.21 ---\n');
fprintf('Data successfully saved to and reloaded from degrees.dat.\n');
fprintf('Loaded array contents (Degrees vs Radians):\n');
for i = 1:size(loaded_data, 1)
    fprintf('    %3.0f deg    %.4g rad\n', loaded_data(i, 1), loaded_data(i, 2));
end