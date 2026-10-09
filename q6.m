%% Question 6: Stem-and-Leaf Display and Central Tendency
clear; clc; close all;

%% Manual Work (answers from paper, for comparison)
% Manual mean = 694/25 = 27.76
% Manual median = 13th value = 27
% Manual modes = 21, 24, 28 (each appears twice)

%% MATLAB Work
x = [12 15 17 18 19 21 21 23 24 24 25 26 27 28 28 29 31 32 34 35 36 ...
    38 41 43 47];
n = numel(x);

% Mean, median and mode using built-in commands
m  = mean(x);
md = median(x);
mo = mode(x);
fprintf('n = %d\n', n);
fprintf('Mean   = %.2f\n', m);
fprintf('Median = %g\n', md);
fprintf('mode() = %d (returns only the smallest mode)\n', mo);

% All modes: every value whose frequency equals the maximum frequency
vals = unique(x);
freq = histcounts(x, [vals, vals(end)+1]);
allModes = vals(freq == max(freq));
fprintf('All modes: %s (each appears %d times)\n', mat2str(allModes), max(freq));
% Matches manual result: mean 27.76, median 27, modes 21, 24 and 28

% Stem-and-leaf display (written procedure)
% Stem = tens digit, leaf = units digit
x = sort(x);
fprintf('\nStem-and-leaf display (key: 2 | 1 means 21 seconds)\n');
for s = floor(min(x)/10) : floor(max(x)/10)
    leaves = mod(x(floor(x/10) == s), 10);
    fprintf('%d | ', s);
    fprintf('%d ', leaves);
    fprintf('\n');
end
% Matches manual display: stems 1 to 4 with 5, 11, 6 and 3 leaves

% Histogram
figure;
histogram(x, 12:5:47);
title('Histogram of Program Execution Times (25 Test Cases)');
xlabel('Execution time (seconds)');
ylabel('Frequency (number of test cases)');
grid on;

% Boxplot
figure;
boxplot(x, 'Orientation', 'horizontal');
title('Boxplot of Program Execution Times');
xlabel('Execution time (seconds)');
grid on;

% Skewness comment: the mean (27.76) is slightly larger than the median (27)
% and the histogram has a longer tail on the right (41, 43, 47), so the
% distribution is mildly right-skewed. In a strongly right-skewed case the
% mean would be pulled much higher than the median, so the median would be
% the better measure.