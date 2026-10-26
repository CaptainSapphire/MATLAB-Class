%% Priya Harry 9/9/26 Practice

%% SECTION 1: Matrix Operations & Statistics
clear; clc;

% Create Matrix A
A = [12 18 15 20;
     10 22 17 19;
     14 16 21 18;
     11 20 19 23];

% 1. Maximum value and row location in each column
[col_max, col_max_rows] = max(A);
disp('Column Maximums:'); disp(col_max);
disp('Row Indices of Column Maximums:'); disp(col_max_rows);

% 2. Maximum value and column location in each row
[row_max, row_max_cols] = max(A, [], 2);
disp('Row Maximums:'); disp(row_max');
disp('Column Indices of Row Maximums:'); disp(row_max_cols');

% 3. Single largest value in matrix A and its location
[overall_max, max_idx] = max(A(:));
[max_row, max_col] = ind2sub(size(A), max_idx);
fprintf('Overall Maximum Value: %d at Row %d, Column %d\n\n', overall_max, max_row, max_col);

% 4. Mean and Median for columns and rows
col_mean = mean(A);
col_median = median(A);
row_mean = mean(A, 2);
row_median = median(A, 2);

disp('Column Means:'); disp(col_mean);
disp('Column Medians:'); disp(col_median);
disp('Row Means:'); disp(row_mean');
disp('Row Medians:'); disp(row_median');

% 5. Mode of each column
col_mode = mode(A);
disp('Column Modes:'); disp(col_mode);
% MATLAB mode note:
% When all values in a column occur only once, MATLAB returns the smallest value in that column as the mode.


%% SECTION 2: Handling Missing Data (NaN)
T = [21.4 21.8 22.0 NaN 21.6 22.1 NaN 21.9];

% Identify missing measurements using isnan
missing_mask = isnan(T);
disp('Missing Data Mask (1 for NaN):'); disp(missing_mask);

% Calculate mean temperature ignoring missing values
mean_temp = mean(T, 'omitnan');
% Alternative logical indexing approach: mean(T(~isnan(T)))
fprintf('Mean Temperature (ignoring NaNs): %.2f °C\n\n', mean_temp);


%% SECTION 3: Random Number Generation
rng(148); 

% Generate 20 random numbers between 0 and 1
rand_nums = rand(1, 20);

% Statistical properties
rand_mean = mean(rand_nums);
rand_min = min(rand_nums);
rand_max = max(rand_nums);
rand_std = std(rand_nums);

fprintf('Rand Numbers - Mean: %.4f, Min: %.4f, Max: %.4f, Std: %.4f\n\n', ...
    rand_mean, rand_min, rand_max, rand_std);


%% SECTION 4: Voltage Simulation & Visualization
% Parameters: 500 measurements, Mean = 12 V, Std Dev = 0.05 V
N = 500;
v_mean_target = 12;
v_std_target = 0.05;

voltage_data = v_mean_target + v_std_target * randn(1, N);

calc_v_mean = mean(voltage_data);
calc_v_std = std(voltage_data);
fprintf('Simulated Voltage - Mean: %.4f V, Standard Deviation: %.4f V\n', ...
    calc_v_mean, calc_v_std);

% Plot Histogram
figure;
histogram(voltage_data, 20);
title('Simulated Sensor Voltage Distribution (N = 500)');
xlabel('Voltage (V)');
ylabel('Frequency');
grid on;


%% SECTION 5: Series RLC Circuit Calculations
R = 100;
L = 0.15;
C = 2.5e-6;
f = 60;

% Angular frequency
omega = 2 * pi * f;

% Individual component impedances
Z_R = R;
Z_L = 1i * omega * L;
Z_C = 1 / (1i * omega * C);

% Total series impedance: Z = Z_R + Z_L + Z_C
Z_total = Z_R + Z_L + Z_C;

% Magnitude and Phase Angle in degrees
Z_mag = abs(Z_total);
Z_phase_deg = rad2deg(angle(Z_total));

fprintf('\nRLC Series Circuit Impedance:\n');
fprintf('  Total Impedance Z: %.2f %+.2fj Ohms\n', real(Z_total), imag(Z_total));
fprintf('  Magnitude |Z|:     %.2f Ohms\n', Z_mag);
fprintf('  Phase Angle:       %.2f degrees\n\n', Z_phase_deg);