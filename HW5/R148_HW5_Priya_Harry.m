% MATLAB Script for Homework 5 (Practice Problems 3.1 - 3.14)

clear;
clc;
format shortg;

%% Problem 3.1
% Find the cube root of -5 using nthroot and by raising -5 to 1/3 power
a_val = nthroot(-5, 3);
b_val = (-5)^(1/3);

% Proof that both results equal -5 when cubed:
a_cubed = a_val^3;
b_cubed = b_val^3;

disp('Problem 3.1 Results:');
fprintf('nthroot result: %.4g\n', a_val);
fprintf('1/3 power result: %.4g + %.4gi\n', real(b_val), imag(b_val));
fprintf('nthroot cubed: %.4g\n', a_cubed);
fprintf('1/3 power cubed: %.4g\n\n', real(b_cubed));


%% Problem 3.2
% Calculate log base b of 10 for b from 1 to 10 in increments of 1
b_base = 1:10;
log_b_10 = log(10) ./ log(b_base);

disp('Problem 3.2 Results:');
disp('Base b values:');
disp(b_base);
disp('log_b(10) values:');
disp(log_b_10);
fprintf('\n');


%% Problem 3.3
% Exponential population growth: P = P0 * exp(r * t)
P0 = 100;       % Initial rabbit population
r_rate = 0.90;  % Continuous annual growth rate (90%)
t_time = 10;    % Time in years

P_rabbits = P0 * exp(r_rate * t_time);

disp('Problem 3.3 Results:');
fprintf('Rabbit population after 10 years: %.4g rabbits\n\n', P_rabbits);


%% Problem 3.4
% Arrhenius reaction rate constant k = k0 * exp(-Q / (R * T))
Q_energy = 8000;    % cal/mol
R_const = 1.987;    % cal/(mol K)
k0 = 1200;          % min^-1
T_kelvin = 100:50:500; % Temperature in K

k_rate = k0 * exp(-Q_energy ./ (R_const .* T_kelvin));

% Display table of temperature and rate constants
rate_table = [T_kelvin', k_rate'];

disp('Problem 3.4 Results (Temperature [K], Rate Constant k [1/min]):');
disp(rate_table);
fprintf('\n');


%% Problem 3.5
% (a) Heat required to be removed per second
heat_lights = 20 * 100;    % 20 bulbs @ 100 J/s
heat_appliance = 4 * 500;  % 4 appliances @ 500 J/s
heat_outdoor = 3000;       % Leakage @ 3000 J/s

heating_load = heat_lights + heat_appliance + heat_outdoor; % J/s

% (b) Number of AC units needed (each unit handles 2000 J/s)
ac_units_needed = ceil(heating_load / 2000);

disp('Problem 3.5 Results:');
fprintf('(a) Heat to remove per second: %.3g J/s\n', heating_load);
fprintf('(b) Air conditioning units required: %d units\n\n', ac_units_needed);


%% Problem 3.6
% (a) Line arrangements of 4 people
ways_4_people = factorial(4);

% (b) Line arrangements of 10 tiles
ways_10_tiles = factorial(10);

disp('Problem 3.6 Results:');
fprintf('(a) Ways to arrange 4 people: %d\n', ways_4_people);
fprintf('(b) Ways to arrange 10 tiles: %.4g\n\n', ways_10_tiles);


%% Problem 3.7
% (a) Committees of 2 people from 12
comm_2_from_12 = nchoosek(12, 2);

% (b) Soccer teams of 11 from 30 students (combinations - order doesn't matter)
teams_unordered = nchoosek(30, 11);

% (c) Soccer teams of 11 from 30 students (permutations - order matters)
teams_ordered = factorial(30) / factorial(30 - 11);

disp('Problem 3.7 Results:');
fprintf('(a) 2-person committees from 12 people: %d\n', comm_2_from_12);
fprintf('(b) Soccer teams (order does not matter): %.4g\n', teams_unordered);
fprintf('(c) Soccer teams (order matters): %.4g\n\n', teams_ordered);


%% Problem 3.8
% Number of 5-card hands possible from a 52-card deck
hands_5_cards = nchoosek(52, 5);

disp('Problem 3.8 Results:');
fprintf('Possible 5-card hands from 52 cards: %.4g\n\n', hands_5_cards);


%% Problem 3.9
% Number of prime numbers between 10,000 and 20,000
primes_up_to_20000 = length(primes(20000));
primes_up_to_10000 = length(primes(10000));
num_primes_in_range = primes_up_to_20000 - primes_up_to_10000;

disp('Problem 3.9 Results:');
fprintf('Prime numbers between 10,000 and 20,000: %d\n\n', num_primes_in_range);


%% Problem 3.10
% Table of sine, cosine, and tangent for angles 0 to 2*pi with step 0.1 rad
theta_arr = (0:0.1:2*pi)';
trig_table = [theta_arr, sin(theta_arr), cos(theta_arr), tan(theta_arr)];

disp('Problem 3.10 Results (Sample - First 5 rows of [theta, sin, cos, tan]):');
disp(trig_table(1:5, :));
fprintf('\n');


%% Problem 3.11
% Displacement of an oscillating spring: x = A * cos(omega * t)
t_sec = (0:10)';    % Time from 0 to 10 seconds
A_amp = 4;          % Maximum displacement in cm
w_freq = 0.6;       % Angular frequency in rad/s

x_disp = A_amp * cos(w_freq .* t_sec);
spring_table = [t_sec, x_disp];

disp('Problem 3.11 Results (Time [s], Displacement [cm]):');
disp(spring_table);
fprintf('\n');


%% Problem 3.12
% Acceleration of the spring: a = -A * omega^2 * cos(omega * t)
a_accel = -A_amp * (w_freq^2) * cos(w_freq .* t_sec);
spring_motion_table = [t_sec, x_disp, a_accel];

disp('Problem 3.12 Results (Time [s], Displacement [cm], Acceleration [cm/s^2]):');
disp(spring_motion_table);
fprintf('\n');


%% Problem 3.13
% Height of building: h = d * tan(theta)
d_dist = 120;             % Distance in meters
theta_deg = [27, 33];     % 30 +/- 3 degrees range

h_heights = d_dist * tand(theta_deg);
min_height = h_heights(1);
max_height = h_heights(2);

disp('Problem 3.13 Results:');
fprintf('Minimum building height: %.3g m\n', min_height);
fprintf('Maximum building height: %.3g m\n\n', max_height);


%% Problem 3.14
% Building height = 200 ft, Distance away = 20 ft
h_build = 200; % ft
d_build = 20;  % ft

% (a) Angle from ground to top of building
tilt_angle_deg = atand(h_build / d_build);

% (b) Distance from head to top of building
dist_head_to_top = sqrt(h_build^2 + d_build^2);

disp('Problem 3.14 Results:');
fprintf('(a) Tilt angle required: %.3g degrees\n', tilt_angle_deg);
fprintf('(b) Distance to top of building: %.3g ft\n', dist_head_to_top);