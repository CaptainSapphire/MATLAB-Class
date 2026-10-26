# 09/09 MATLAB Functions Practice Problems 
Please use today’s class time to complete the following MATLAB practice assignment independently.

Create one MATLAB script named R148_Data_Analysis_Practice.m. Clearly label each problem with comments, show your results in the Command Window, and add a brief comment explaining what each answer means.

Create the matrix

A = [12 18 15 20;
     10 22 17 19;
     14 16 21 18;
     11 20 19 23];
Find the maximum value in each column. Also determine the row number where each column maximum occurs.

Using matrix A, find the maximum value in each row. Also determine the column number where each row maximum occurs.

Find the single largest value in the entire matrix A. Determine its row and column location.

For matrix A, calculate the mean and median of each column. Then calculate the mean and median of each row.

Find the mode of each column in A. Write one sentence in a MATLAB comment explaining what MATLAB returns when all values in a column occur only once.

A sensor records the following temperatures in degrees Celsius:

T = [21.4 21.8 22.0 NaN 21.6 22.1 NaN 21.9];
Use isnan to identify the missing measurements. Calculate the mean temperature while ignoring the missing values. Do not manually delete the NaN values from the original vector.

Use rng(148) to make your work reproducible. Generate 20 random numbers between 0 and 1 using rand. Find their mean, minimum, maximum, and standard deviation.

Simulate 500 voltage measurements from a 12 V sensor with normally distributed noise having a standard deviation of 0.05 V. Use randn. Calculate the mean and standard deviation of your simulated voltage data, and make a histogram with an appropriate title and axis labels.

For a series AC circuit with , , , and frequency , calculate:
Total series impedance 
Magnitude and phase angle of  in degrees
Use 1i, abs, angle, and rad2deg.
Demonstrate a computational limitation in MATLAB by comparing 0.1 + 0.2 with 0.3.
Store the two values in variables.
Display their difference.
Test whether they are exactly equal using ==.
Use a tolerance of 1e-12 to test whether they are approximately equal.
In a MATLAB comment, explain why a tolerance comparison is usually safer for calculated decimal values.

Please complete the assignment before the end of class and submit your .m file as directed in Canvas. Take care, and I will see you next class.

Prof. Wang
