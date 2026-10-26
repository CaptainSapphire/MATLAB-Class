%% Problem 1 - Scalar Calculations
disp('Problem 1 - Scalar Calculations: Use MATLAB to evaluate each expression. Write the MATLAB expression and report the result.')
% a) 5^2
p1_a = 5^2;
fprintf('(a) 5^2 = %g\n', p1_a);

% (b) (5+3)/(5*6)
p1_b = (5 + 3) / (5 * 6);
fprintf('(b) (5+3)/(5*6) = %g\n', p1_b);

% (c) sqrt(4+6^3)
p1_c = sqrt(4 + 6^3);
fprintf('(c) sqrt(4+6^3) = %g\n\n', p1_c);


%% Problem 2
disp('Problem 2 -  Variables and Engineering Formulas: Use variables for the radius and calculated quantities.')

% (a) Area of a circle (r = 5)
r_circle = 5;
area_circle = pi * r_circle^2;
fprintf('(a) Circle Area (r = 5): %g\n', area_circle);

% (b) Surface area of a sphere (r = 10 ft)
r_sphere_sa = 10;
sa_sphere = 4 * pi * r_sphere_sa^2;
fprintf('(b) Sphere Surface Area (r = 10 ft): %g ft^2\n', sa_sphere);

% (c) Volume of a sphere (r = 2 ft)
r_sphere_v = 2;
vol_sphere = (4/3) * pi * r_sphere_v^3;
fprintf('(c) Sphere Volume (r = 2 ft): %g ft^3\n\n', vol_sphere);

%% Problem 3
disp('Problem 3 - Working with Vectors ')
% (a) Cylinder volumes: r = 3, h = [1, 5, 12]
r_cyl = 3;
h_cyl = [1, 5, 12];
V_cylinders = pi * r_cyl^2 * h_cyl;
disp('(a) Cylinder Volumes for h = [1, 5, 12]:');
disp(V_cylinders);

% (b) Triangle areas: b = [2, 4, 6], h = 12
b_tri = [2, 4, 6];
h_tri = 12;
A_triangles = 0.5 * b_tri * h_tri;
disp('(b) Triangle Areas for b = [2, 4, 6]:');
disp(A_triangles);
fprintf('\n');

%% Problem 4
disp('Problem 4 - Creating Vectors ')
% (a) Values from 1 to 20 in increments of 1
vec_a = 1:1:20;
disp('(a) Colon operator (1 to 20, step 1):');
disp(vec_a);

% (b) Values from 0 to 2*pi in increments of pi/10
vec_b = 0:(pi/10):(2*pi);
disp('(b) Colon operator (0 to 2*pi, step pi/10):');
disp(vec_b);

% (c) 15 evenly spaced values between 4 and 20 using linspace
vec_c = linspace(4, 20, 15);
disp('(c) linspace (15 values between 4 and 20):');
disp(vec_c);

% (d) 10 logarithmically spaced values between 10 (10^1) and 1000 (10^3) using logspace
vec_d = logspace(1, 3, 10);
disp('(d) logspace (10 values between 10^1 and 10^3):');
disp(vec_d);
fprintf('\n');


%% Problem 5
disp('Problem 5 - Unit Conversion with Vectors ')
% Vector from 0 to 10 ft in 1 ft increments
feet = 0:1:10;

% Convert feet to meters (1 ft = 0.3048 m)
meters = feet * 0.3048;

% Display table of results
disp('Table: Feet to Meters Conversion');
disp(table(feet', meters', 'VariableNames', {'Feet', 'Meters'}));

%% Question: If the number of values in feet changes, do you need to rewrite the conversion equation? Briefly explain in a MATLAB comment.

% No, you do not need to rewrite the conversion equation. Because MATLAB performs scalar-vector multiplication element-by-element automatically, the expression "meters = feet * 0.3048" works for a vector of any length.

%% Problem 6
disp('Problem 6 - Engineering Application: Free Fall ')

% The distance traveled by a freely falling object, neglecting air resistance, is d = (1/2)gt2, where g = 9.8 m/s2.
% Create a time vector from 0 to 10 seconds in increments of 1 second. Use MATLAB to calculate the corresponding distance for every time value.

g = 9.8; % Acceleration due to gravity (m/s^2)
t = 0:1:10; % Time vector from 0 to 10 seconds

% (.^) is required because t is a vector
d = 0.5 * g * (t.^2);

% Display results in a formatted table
disp('Free Fall Data (Time vs Distance):');
disp(table(t', d', 'VariableNames', {'Time_sec', 'Distance_m'}));

% 1. Distance at t = 5 s (index 6, since t starts at 0)\, "1. What distance has the object traveled after 5 seconds?"
d_5s = d(t == 5);
fprintf('1. Distance traveled after 5 seconds: %g meters\n', d_5s);

% 2. Distance at t = 10 s (index 11), "What distance has it traveled after 10 seconds?"
d_10s = d(t == 10);
fprintf('2. Distance traveled after 10 seconds: %g meters\n', d_10s);

% 3. Why the element-by-element operator is important:
% The regular exponent operator (^) performs matrix exponentiation which is undefined for a 1x11 row vector multiplied by another 1x11 row vector.
% The dot-power operator (.^) has  each individual element inside the vector t is squared independently.