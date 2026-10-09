%% Question 1: Variables, Measurement Scales and Measurement Error
clear; clc; close all;

%% Manual Work (answers from paper, for comparison)
% Manual mean absolute error = 0.14 months

%% MATLAB Work
% NOTE: Only the first 5 development times are given in the question.
% Values for projects 6-12 are assumed (dummy data) for demonstration.
projectID    = (1:12)';
developers   = [4 6 3 8 5 7 10 4 6 9 5 3]';
devTime      = [5.1 5.0 5.3 4.9 5.2 6.4 7.8 4.5 5.9 8.2 5.6 3.8]';
defects      = [12 18 9 25 14 20 31 10 17 28 15 7]';
satisfaction = [8 7 9 6 8 7 5 9 7 6 8 9]';

% Display data as a table
T = table(projectID, developers, devTime, defects, satisfaction);
disp(T)

% Measurement error (using the 5 given observations)
obs     = [5.1 5.0 5.3 4.9 5.2];
trueVal = 5.0;
err     = obs - trueVal;
mae     = mean(abs(err));

fprintf('Errors: %s\n', mat2str(round(err, 1)));
fprintf('Mean absolute error = %.2f months\n', mae);
% Matches manual result: MAE = 0.14

% Plot: histogram of development time
figure;
histogram(devTime, 5);
% TODO: add title, xlabel, ylabel and grid on here (your task)
% TODO: add a 2-line comment explaining why a histogram suits this variable

title('Q1 graph');
xlabel('development time');
ylabel('number of projects');
grid on;