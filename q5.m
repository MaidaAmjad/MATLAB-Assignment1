%% Question 5: Frequency Curves and Data Presentation
clear; clc; close all;

%% Manual Work (answers from paper, for comparison)
% Manual classes: 40-50, 50-60, ..., 90-100 (width 10)
% Manual frequencies = 3 7 10 12 12 6
% Manual cumulative frequencies = 3 10 20 32 44 50

%% MATLAB Work
scores = [42 55 61 67 72 74 81 69 58 63 77 85 91 48 52 66 71 73 79 82 ...
    88 93 57 62 68 75 80 84 87 90 45 50 59 64 70 76 78 83 86 89 ...
    94 96 54 60 65 72 74 81 85 92];
n = numel(scores);
fprintf('n = %d, min = %d, max = %d\n', n, min(scores), max(scores));

% Grouped frequency distribution (class width 10)
edges  = 40:10:100;
counts = histcounts(scores, edges);
mid    = (edges(1:end-1) + edges(2:end)) / 2;
rel    = counts / n;
cum    = cumsum(counts);

lower = edges(1:end-1)';
upper = edges(2:end)';
T = table(lower, upper, mid', counts', rel', cum', ...
    'VariableNames', {'Lower','Upper','Midpoint','Freq','RelFreq','CumFreq'});
disp(T)
% Matches manual result: frequencies 3 7 10 12 12 6, cumulative ends at 50

% Figure 1: Histogram
figure;
histogram(scores, edges);
title('Histogram of Programming Test Scores (50 Students)');
xlabel('Test score (out of 100)');
ylabel('Frequency (number of students)');
grid on;

% Figure 2: Frequency polygon (class midpoints vs frequencies)
% An empty class (frequency 0) is added at each end so the polygon
% touches the x-axis.
polyX = [mid(1) - 10, mid, mid(end) + 10];
polyY = [0, counts, 0];
figure;
plot(polyX, polyY, '-o', 'LineWidth', 1.5);
title('Frequency Polygon of Programming Test Scores');
xlabel('Class midpoint (test score)');
ylabel('Frequency (number of students)');
grid on;

% Figure 3: Cumulative frequency curve (less-than ogive)
figure;
plot(edges, [0 cum], '-o', 'LineWidth', 1.5);
title('Cumulative Frequency Curve (Less-than Ogive) of Test Scores');
xlabel('Upper class boundary (test score)');
ylabel('Cumulative frequency (number of students)');
grid on;

% Comparison: the shapes agree with the manual plots. The histogram and
% polygon peak at 70-90 with a longer tail towards the low scores
% (left-skewed), and the ogive rises from 0 to 50.