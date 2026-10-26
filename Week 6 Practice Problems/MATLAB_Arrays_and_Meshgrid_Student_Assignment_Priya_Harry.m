%% MATLAB Arrays and Meshgrid Student Assignment
% Name: Priya Harry
% Date: 9/15/2026
% Course and section: ENGR R148
%
% Complete every TODO in this file. Run each section separately and confirm
% that it works before moving to the next section.

clear; clc; close all;
format compact

%% Part A Numeric array fundamentals
% Task 1
% Create a row vector named multiplesOfFive that begins at 5, ends at 40,
% and increases by 5. Display its size and number of elements.

multiplesOfFive = 5:5:40;
disp(size(multiplesOfFive));
disp(numel(multiplesOfFive));

% Task 2
% Use the array A below to complete the requested indexing operations.
A = [12 18 24 30; 5 10 15 20; 7 14 21 28];

% a. Store row 2 in a variable named secondRow.
secondRow = A(2, :);

% b. Store column 3 in a variable named thirdColumn.
thirdColumn = A(:, 3);

% c. Store rows 1 through 2 and columns 2 through 4 in selectedBlock.
selectedBlock = A(1:2, 2:4);

% d. Store the last value in the last row in bottomRight.
bottomRight = A(end, end);

% e. Use logical indexing to store all values greater than 20 in aboveTwenty.
aboveTwenty = A(A > 20);

% Task 3
% Make a copy of A named Amodified. Change the entry in row 2, column 1 to
% 50. Then delete column 4 from Amodified. Display the final array and size.

Amodified = A;
Amodified(2, 1) = 50;
Amodified(:, 4) = [];
disp(Amodified);
disp(size(Amodified));

%% Part B Reshape transpose and concatenate
% Task 4
% The vector data contains 12 values.
data = 1:12;

% a. Reshape data into a 4-by-3 array named R.
R = reshape(data, 4, 3);

% b. Transpose R without complex conjugation and store the result in RT.
RT = R.';

% c. Create a column vector extraColumn that has three entries: 100, 200,
%    and 300.
extraColumn = [100; 200; 300];

% d. Concatenate RT and extraColumn horizontally to create combinedArray.
combinedArray = [RT, extraColumn];

% e. Display the size of combinedArray.
disp(size(combinedArray));

%% Part C Rectangle area with meshgrid
% Task 5
% Find the area of every rectangle formed from these dimensions.
lengths = 2:2:8;       % cm
widths = [1 3 5];      % cm

% a. Use meshgrid to create LengthGrid and WidthGrid.
[LengthGrid, WidthGrid] = meshgrid(lengths, widths);

% b. Calculate all rectangle areas in an array named Area.
Area = LengthGrid .* WidthGrid;

% c. Display Area. It should contain 12 values.
disp(Area);

% d. Find the largest area and store it in maximumArea.
[maximumArea, linearIdx] = max(Area(:));

% e. Find the length and width that produce maximumArea. Store them in
%    lengthAtMaximum and widthAtMaximum.
lengthAtMaximum = LengthGrid(linearIdx);
widthAtMaximum = WidthGrid(linearIdx);

%% Part D Pressure distribution over a plate
% Task 6
% A pressure field over a rectangular plate is modeled by
%
%   P = 120 / (1 + 0.20*x^2 + 0.35*y^2)
%
% where x and y are measured in meters and P is measured in kilopascals.
x = -4:0.25:4;
y = -3:0.25:3;

% a. Use meshgrid to create X and Y.
[X, Y] = meshgrid(x, y);

% b. Evaluate the model at every coordinate pair and store the result in P.
%    Use the required elementwise operators.
P = 120 ./ (1 + 0.20 .* X.^2 + 0.35 .* Y.^2);

% c. Display the sizes of X, Y, and P.
disp(size(X));
disp(size(Y));
disp(size(P));

% d. Create a surface plot with axis labels, a title, a colorbar, and grid.
figure;
surf(X, Y, P);
xlabel('x (m)');
ylabel('y (m)');
zlabel('Pressure (kPa)');
title('Pressure Field Distribution over Plate');
colorbar;
grid on;

% e. Create a filled contour plot in a second figure. Use 15 contour levels,
%    axis equal tight, axis labels, a title, and a colorbar.
figure;
contourf(X, Y, P, 15);
axis equal tight;
xlabel('x (m)');
ylabel('y (m)');
title('Pressure Contour Lines (kPa)');
colorbar;

% f. Find the maximum sampled pressure and its x and y coordinates. Store
%    the results in maximumPressure, xAtMaximum, and yAtMaximum.
[maximumPressure, pIdx] = max(P(:));
xAtMaximum = X(pIdx);
yAtMaximum = Y(pIdx);

%% Part E Debug and explain
% Task 7
% The following lines are intended to evaluate z = x^2 + y^2 at every
% coordinate pair, but one line contains an error.
xDebug = -2:0.5:2;
yDebug = -1:0.5:1;
[XDebug, YDebug] = meshgrid(xDebug, yDebug);

% Incorrect line. Keep it commented until you correct it.
% ZDebug = XDebug^2 + YDebug^2;

% a. Write a corrected line below.
ZDebug = XDebug.^2 + YDebug.^2;

% b. Explanation:
% The original line fails because `^` performs standard matrix exponentiation, 
% which requires a square matrix. Since XDebug and YDebug are 2D arrays, MATLAB 
% throws a matrix dimension error. Using `.^` forces elementwise exponentiation.

% c. Prediction:
% Size prediction: 5-by-9. (yDebug has 5 elements, so there are 5 rows; 
% xDebug has 9 elements, so there are 9 columns).
disp(size(ZDebug));

%% Optional challenge
% Modify the pressure model so its maximum occurs at x = 1 m and y = -0.5
% m while keeping the same maximum pressure. Plot the modified surface.

P_modified = 120 ./ (1 + 0.20 .* (X - 1).^2 + 0.35 .* (Y - (-0.5)).^2);

figure;
surf(X, Y, P_modified);
xlabel('x (m)');
ylabel('y (m)');
zlabel('Pressure (kPa)');
title('Shifted Pressure Field (Max at x=1m, y=-0.5m)');
colorbar;
grid on;