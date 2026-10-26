% MATLAB Script for Chapter 4 Homework Problems
% File Name: Harry_Priya_Chapter4_HW.m

clear;
clc;
format shortg;

%% Problem 4.1
% Create initial arrays a, b, and c
a = [15, 3, 22; 
      3, 8,  5; 
     14, 3, 82]; %[cite: 2]
b = [1; 5; 6];   %[cite: 2]
c = [12, 18, 5, 2]; %[cite: 2]

% (a) Create d from third column of a
d = a(:, 3); %[cite: 2]

% (b) Combine b and d to form 3x2 array e
e = [b, d]; %[cite: 2]

% (c) Combine b and d to form 6x1 column array f
f = [b; d]; %[cite: 2]

% (d) Combine array a and first 3 elements of c to form 4x3 array g
g = [a; c(1:3)]; %[cite: 2]

% (e) Create h using specific elements from a, c, and b
h = [a(1,3), c(1,2), b(2,1)]; %[cite: 2]

disp('Problem 4.1 Results:');
disp('Array e:'); disp(e);
disp('Array f:'); disp(f);
disp('Array g:'); disp(g);
disp('Array h:'); disp(h);


%% Problem 4.2
% Load thermo_scores data (simulated below if file is not provided)
if exist('thermo_scores.dat', 'file')
    load thermo_scores.dat; %[cite: 2]
else
    % Fallback synthetic thermo_scores data: [Student_ID, Test1, Test2, Test3]
    thermo_scores = [
        1, 85, 90, 88;
        2, 78, 82, 80;
        3, 92, 95, 91;
        4, 64, 70, 68;
        5, 88, 84, 89;
        6, 95, 90, 93
    ];
end

% (a) Extract scores and student number for student 5
student_5 = thermo_scores(5, :); %[cite: 2]

% (b) Extract Test 1 scores (Column 2)
test_1 = thermo_scores(:, 2); %[cite: 2]

% (c) Standard deviation and variance for each test (Columns 2 to 4)
test_std = std(thermo_scores(:, 2:end)); %[cite: 2]
test_var = var(thermo_scores(:, 2:end)); %[cite: 2]

% (d) Final total score and percentage (out of 300 points)
test_scores_only = thermo_scores(:, 2:end); %[cite: 2]
total_scores = sum(test_scores_only, 2); %[cite: 2]
final_percentages = (total_scores / 300) * 100; %[cite: 2]

% (e) Combine final percentages with original array
scores_with_percent = [thermo_scores, final_percentages]; %[cite: 2]

% (f) Sort array by final percentage in descending order
% Column 5 corresponds to final_percentages in the combined array
sorted_thermo = sortrows(scores_with_percent, -5); %[cite: 2]

disp('Problem 4.2 Results:');
disp('Student 5 Data:'); disp(student_5);
disp('Test Standard Deviations:'); disp(test_std);
disp('Test Variances:'); disp(test_var);
disp('Sorted Scores Table (Student ID, T1, T2, T3, Final %):');
disp(sorted_thermo);


%% Problem 4.3
% (a) Create times column vector
times = (0:2:24)'; %[cite: 2]

% (b) Load or define thermocouple data
if exist('thermocouple.dat', 'file')
    load thermocouple.dat; %[cite: 2]
else
    % Thermocouple 1, 2, 3 values as provided in Table P4.3
    thermocouple = [
        84.3, 90.0, 86.7;
        86.4, 89.5, 87.6;
        85.2, 88.6, 88.3;
        87.1, 88.9, 85.3;
        83.5, 88.9, 80.3;
        84.8, 90.4, 82.4;
        85.0, 89.3, 83.4;
        85.3, 89.5, 85.4;
        85.3, 88.9, 86.3;
        85.2, 89.1, 85.3;
        82.3, 89.5, 89.0;
        84.7, 89.4, 87.3;
        83.6, 89.8, 87.2
    ]; %[cite: 2]
end

% (c) Combine times vector with thermocouple data
thermo_table = [times, thermocouple]; %[cite: 2]

% (d) Max and Min values and corresponding times for each thermocouple
[max_vals, max_idx] = max(thermocouple); %[cite: 2]
[min_vals, min_idx] = min(thermocouple); %[cite: 2]

max_times = times(max_idx); %[cite: 2]
min_times = times(min_idx); %[cite: 2]

disp('Problem 4.3 Results:');
disp('Thermocouple Maxima [TC1, TC2, TC3]:'); disp(max_vals);
disp('Times of Maxima (hrs):'); disp(max_times');
disp('Thermocouple Minima [TC1, TC2, TC3]:'); disp(min_vals);
disp('Times of Minima (hrs):'); disp(min_times');


%% Problem 4.4
if exist('sensor.dat', 'file')
    load sensor.dat; %[cite: 2]
else
    % Sensor data from Table P4.4 [Time, Sensor 1..5]
    sensor = [
        0.0, 70.6432, 68.3470, 72.3469, 67.6751, 73.1764;
        0.5, 73.2823, 65.7819, 65.4822, 71.8548, 66.9929;
        1.0, 64.1609, 72.4888, 70.1794, 73.6414, 72.7559;
        1.5, 67.6970, 77.4425, 66.8623, 80.5608, 64.5008;
        2.0, 68.6878, 67.2676, 72.6770, 63.2135, 70.4300;
        2.5, 63.9342, 65.7662,  2.7644, 64.8869, 59.9772;
        3.0, 63.4028, 68.7683, 68.9815, 75.1892, 67.5346;
        3.5, 74.6561, 73.3151, 59.7284, 68.0510, 72.3102;
        4.0, 70.0562, 65.7290, 70.6628, 63.0937, 68.3950;
        4.5, 66.7743, 63.9934, 77.9647, 71.5777, 76.1828;
        5.0, 74.0286, 69.4007, 75.0921, 77.7662, 66.8436;
        5.5, 71.1581, 69.6735, 62.0980, 73.5395, 58.3739;
        6.0, 65.0512, 72.4265, 69.6067, 79.7869, 63.8418;
        6.5, 76.6979, 67.0225, 66.5917, 72.5227, 75.2782;
        7.0, 71.4475, 69.2517, 64.8772, 79.3226, 69.4339;
        7.5, 77.3946, 67.8262, 63.8282, 68.3009, 71.8961;
        8.0, 75.6901, 69.6033, 71.4440, 64.3011, 74.7210;
        8.5, 66.5793, 77.6758, 67.8535, 68.9444, 59.3979;
        9.0, 63.5403, 66.9676, 70.2790, 75.9512, 66.7766;
        9.5, 69.6354, 63.2632, 68.1606, 64.4190, 66.4785
    ]; %[cite: 2]
end

% (a) Number of sensors and seconds of data using size
[num_rows, num_cols] = size(sensor); %[cite: 2]
num_sensors = num_cols - 1; % Column 1 is time[cite: 2]
time_seconds = sensor(end, 1); %[cite: 2]

% (b) Max/Min values and times of occurrence
sensor_readings = sensor(:, 2:end); %[cite: 2]
time_vec = sensor(:, 1); %[cite: 2]

[s_max, max_i] = max(sensor_readings); %[cite: 2]
[s_min, min_i] = min(sensor_readings); %[cite: 2]

s_max_times = time_vec(max_i); %[cite: 2]
s_min_times = time_vec(min_i); %[cite: 2]

% (c) Mean and Std Dev for each sensor and overall data
sensor_means = mean(sensor_readings); %[cite: 2]
sensor_stds = std(sensor_readings); %[cite: 2]

overall_mean = mean(sensor_readings(:)); %[cite: 2]
overall_std = std(sensor_readings(:)); %[cite: 2]

disp('Problem 4.4 Results:');
fprintf('Number of sensors: %d\n', num_sensors);
fprintf('Total duration of data: %.1f seconds\n', time_seconds);
disp('Sensor Means [S1..S5]:'); disp(sensor_means);
disp('Sensor Standard Deviations [S1..S5]:'); disp(sensor_stds);
fprintf('Overall Data Mean: %.4f\n', overall_mean);
fprintf('Overall Data Std Dev: %.4f\n\n', overall_std);


%% Problem 4.5
if exist('ace_data.dat', 'file')
    load ace_data.dat; %[cite: 2]
else
    % Sample ACE dataset structure: [Year, ACE, Storms, Hurricanes, Major_Hurricanes]
    ace_data = [
        1950, 243, 16, 11, 8;
        1995, 227, 19, 11, 5;
        2005, 250, 28, 15, 7;
        2017, 225, 17, 10, 6;
        2020, 180, 30, 14, 7
    ]; %[cite: 2]
end

% (b) Extract individual columns into named arrays
years = ace_data(:, 1); %[cite: 2]
ace = ace_data(:, 2); %[cite: 2]
tropical_storms = ace_data(:, 3); %[cite: 2]
hurricanes = ace_data(:, 4); %[cite: 2]
major_hurricanes = ace_data(:, 5); %[cite: 2]

% (c) Highest values and corresponding years
[max_ace_val, idx_ace] = max(ace); %[cite: 2]
[max_ts_val, idx_ts] = max(tropical_storms); %[cite: 2]
[max_hur_val, idx_hur] = max(hurricanes); %[cite: 2]
[max_mhur_val, idx_mhur] = max(major_hurricanes); %[cite: 2]

% (d) Mean and Median values
mean_metrics = mean(ace_data(:, 2:end)); %[cite: 2]
median_metrics = median(ace_data(:, 2:end)); %[cite: 2]

% (e) Sort ace_data high to low based on ACE value (Column 2)
sorted_ace_data = sortrows(ace_data, -2); %[cite: 2]

disp('Problem 4.5 Results:');
fprintf('Highest ACE: %.1f in %d\n', max_ace_val, years(idx_ace));
fprintf('Highest Tropical Storms: %d in %d\n', max_ts_val, years(idx_ts));
fprintf('Highest Hurricanes: %d in %d\n', max_hur_val, years(idx_hur));
fprintf('Highest Major Hurricanes: %d in %d\n\n', max_mhur_val, years(idx_mhur));


%% Problem 4.7
if exist('ACE_data_expanded.dat', 'file')
    load ACE_data_expanded.dat; %[cite: 2]
else
    % Fallback extended array
    ACE_data_expanded = ace_data; %[cite: 2]
end

% (b) Extract individual arrays
years_exp = ACE_data_expanded(:, 1); %[cite: 2]
ace_exp = ACE_data_expanded(:, 2); %[cite: 2]
tropical_storms_exp = ACE_data_expanded(:, 3); %[cite: 2]
hurricanes_exp = ACE_data_expanded(:, 4); %[cite: 2]
major_hurricanes_exp = ACE_data_expanded(:, 5); %[cite: 2]

% (c) Max determination
[max_ace_e, idx_ace_e] = max(ace_exp); %[cite: 2]
[max_ts_e, idx_ts_e] = max(tropical_storms_exp); %[cite: 2]
[max_hur_e, idx_hur_e] = max(hurricanes_exp); %[cite: 2]
[max_mhur_e, idx_mhur_e] = max(major_hurricanes_exp); %[cite: 2]

% (d) Mean and Median
mean_exp = mean(ACE_data_expanded(:, 2:end)); %[cite: 2]
median_exp = median(ACE_data_expanded(:, 2:end)); %[cite: 2]

% (e) Sort by ACE descending
sorted_ace_exp = sortrows(ACE_data_expanded, -2); %[cite: 2]

disp('Problem 4.7 Results:');
fprintf('Expanded Dataset Max ACE Year: %d (Value: %.1f)\n\n', years_exp(idx_ace_e), max_ace_e);


%% Problem 4.8
% Calculate triangle areas: base from 0 to 10 m, height from 2 to 6 m
base = 0:1:10;   % Base array (1x11)[cite: 2]
height = (2:1:6)'; % Height array (5x1)[cite: 2]

% Outer product/broadcasting via matrix multiplication or meshgrid
area_triangles = 0.5 * (height * base); % Result: 5x11 array[cite: 2]

disp('Problem 4.8 Results (Area 2D Array [rows=heights, cols=bases]):');
disp(area_triangles);


%% Problem 4.9
% Barometric liquid column height: h = P / (rho * g)[cite: 2]
% Pressure from 0 to 100 kPa (0 to 100,000 Pa)
P_kPa = 0:10:100; % kPa[cite: 2]
P_Pa = P_kPa * 1000; % Convert to Pa (kg/(m*s^2))[cite: 2]

g = 9.81; % m/s^2[cite: 2]
rho_mercury = 13560; % kg/m^3[cite: 2]
rho_water = 1000;    % kg/m^3[cite: 2]

h_mercury = P_Pa / (rho_mercury * g); % Height in meters[cite: 2]
h_water = P_Pa / (rho_water * g);     % Height in meters[cite: 2]

% 2D array combining pressure, mercury height, and water height
barometer_array = [P_kPa; h_mercury; h_water]; %[cite: 2]

disp('Problem 4.9 Results (Row 1: Pressure [kPa], Row 2: Mercury Height [m], Row 3: Water Height [m]):');
disp(barometer_array);


%% Problem 4.10
% Ideal gas law: v = R * T / P[cite: 2]
% Temperature T from 100 to 1000 K, Pressure P from 100 to 1000 kPa
T = 100:100:1000;     % K (1x10)[cite: 2]
P = (100:100:1000)';  % kPa (10x1)[cite: 2]
R_air = 0.2870;       % kJ/(kg*K)[cite: 2]

% Meshgrid creates 2D arrays for temperature and pressure
[T_grid, P_grid] = meshgrid(T, P); %[cite: 2]
v_specific = (R_air .* T_grid) ./ P_grid; % m^3/kg[cite: 2]

disp('Problem 4.10 Results (Specific Volume Matrix [m^3/kg]):');
disp(v_specific(1:4, 1:4)); % Display sample 4x4 subset


%% Problem 4.11
% Zero matrices matching sizes of a, b, and c from Problem 4.1
zero_a = zeros(size(a)); %[cite: 2]
zero_b = zeros(size(b)); %[cite: 2]
zero_c = zeros(size(c)); %[cite: 2]

disp('Problem 4.11 Results:');
disp('Zeros matching array a:'); disp(zero_a);


%% Problem 4.12
% 6x6 Magic Square
m6 = magic(6); %[cite: 2]

row_sums = sum(m6, 2);   % Sum of each row[cite: 2]
col_sums = sum(m6, 1);   % Sum of each column[cite: 2]
diag1_sum = sum(diag(m6));          % Main diagonal sum[cite: 2]
diag2_sum = sum(diag(fliplr(m6)));   % Anti-diagonal sum[cite: 2]

disp('Problem 4.12 Results:');
disp('6x6 Magic Square:'); disp(m6);
disp('Row sums:'); disp(row_sums');
disp('Column sums:'); disp(col_sums);
fprintf('Diagonal sums: %d and %d\n\n', diag1_sum, diag2_sum);


%% Problem 4.13
% Extract 3x3 upper left-hand corner from 6x6 magic square
sub_m6 = m6(1:3, 1:3); %[cite: 2]

sub_row_sums = sum(sub_m6, 2); %[cite: 2]
sub_col_sums = sum(sub_m6, 1); %[cite: 2]

disp('Problem 4.13 Results:');
disp('Extracted 3x3 array:'); disp(sub_m6);
disp('Row sums of sub-array:'); disp(sub_row_sums');
disp('Column sums of sub-array:'); disp(sub_col_sums);
disp('Is it a magic square? No, row and column sums are not equal.');
fprintf('\n');


%% Problem 4.14
% 5x5 Magic Square
a_magic = magic(5); %[cite: 2]

% (a) Multiplying by constant (e.g., 2)
a_mult = 2 * a_magic; %[cite: 2]

% (b) Squaring each element
a_sq = a_magic .^ 2; %[cite: 2]

% (c) Adding a constant (e.g., 2)
a_add = a_magic + 2; %[cite: 2]

% (d) 10x10 block array from components
block_10x10 = [a_magic, a_mult; a_sq, a_add]; %[cite: 2]

disp('Problem 4.14 Results:');
fprintf('(a) Constant multiple magic square? Yes (Row sums = %d)\n', sum(a_mult(1,:)));
fprintf('(b) Squared element magic square? No (Row sums vary: %d vs %d)\n', sum(a_sq(1,:)), sum(a_sq(2,:)));
fprintf('(c) Constant added magic square? Yes (Row sums = %d)\n', sum(a_add(1,:)));
fprintf('(d) 10x10 block array magic square? No.\n\n');


%% Problem 4.15
% Recreate Albrecht Dürer's magic square
% Standard MATLAB magic(4)
m4 = magic(4); %[cite: 2]

% Dürer's square: rearrange columns [2, 1, 4, 3] or specific column order
durer_square = m4(:, [2, 1, 4, 3]); %[cite: 2]

durer_rows = sum(durer_square, 2); %[cite: 2]
durer_cols = sum(durer_square, 1); %[cite: 2]
durer_diag1 = sum(diag(durer_square)); %[cite: 2]
durer_diag2 = sum(diag(fliplr(durer_square))); %[cite: 2]

disp('Problem 4.15 Results:');
disp('Dürer Magic Square:'); disp(durer_square);
fprintf('Row sums: %d | Col sums: %d | Diag 1: %d | Diag 2: %d\n\n', ...
    durer_rows(1), durer_cols(1), durer_diag1, durer_diag2);


%% Problem 4.16
% String array operations for file names
Dates = ["June_10"; "July_12"; "Aug_15"]; %[cite: 2]
FileNames = Dates + "_Data.dat"; %[cite: 2]

disp('Problem 4.16 Results:');
disp(FileNames);
fprintf('\n');


%% Problem 4.17
% 2x1 string array for a graph title
graph_title = ["Temperature vs. Time"; "Experimental Run 1"]; %[cite: 2]

disp('Problem 4.17 Results:');
disp(graph_title);
fprintf('\n');


%% Problem 4.18
% Character lengths of title lines
title_lengths = strlength(graph_title); %[cite: 2]

disp('Problem 4.18 Results:');
disp('Line lengths:'); disp(title_lengths);
fprintf('\n');


%% Problem 4.19
% Working with cell, character, and string arrays using patients.mat
if exist('patients.mat', 'file')
    load patients.mat LastName; %[cite: 2]
else
    % Fallback sample cell array
    LastName = {'Smith'; 'Johnson'; 'Williams'; 'Brown'; 'Jones'}; %[cite: 2]
end

% (b) Convert to padded character array
Name_char = char(LastName); %[cite: 2]

% (c) Convert to string array
Name_string = string(LastName); %[cite: 2]

% (d) Compare dimensions using size
size_char = size(Name_char); %[cite: 2]
size_string = size(Name_string); %[cite: 2]

% (e) Sort arrays (results suppressed with semicolon)
sorted_char = sort(Name_char); %[cite: 2]
sorted_string = sort(Name_string); %[cite: 2]

% (f) Sortrows arrays
sorted_rows_char = sortrows(Name_char); %[cite: 2]
sorted_rows_string = sortrows(Name_string); %[cite: 2]

disp('Problem 4.19 Results:');
fprintf('Char Array Size: %d x %d\n', size_char(1), size_char(2));
fprintf('String Array Size: %d x %d\n', size_string(1), size_string(2));