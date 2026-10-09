%% Question 4: Grouped Frequency Distribution of API Response Times
clear; clc; close all;

%% Manual Work (answers from paper, for comparison)
% Manual Sturges k = 6.32 -> 6 classes, width 10, starting at 110
% Manual frequencies = 3 8 10 9 8 2
% Manual cumulative frequencies = 3 11 21 30 38 40
% Manual median class = 130-140

%% MATLAB Work
data = [112 125 118 143 156 134 129 145 151 138 119 127 133 148 162 155 ...
    141 136 124 130 147 153 158 121 139 132 146 160 135 128 142 149 ...
    154 137 126 131 144 159 150 122];

% Minimum, maximum and sample size
n = numel(data);
mn = min(data);
mx = max(data);
fprintf('n = %d, min = %d, max = %d, range = %d\n', n, mn, mx, mx - mn);

% Sturges' rule
k = 1 + 3.322 * log10(n);
fprintf('Sturges k = %.2f -> use 6 classes\n', k);

% Class edges chosen from the manual work (width 10, 110 to 170)
edges = 110:10:170;
counts = histcounts(data, edges);
rel = counts / n;
cum = cumsum(counts);

% Grouped frequency table
lower = edges(1:end-1)';
upper = edges(2:end)';
T = table(lower, upper, counts', rel', cum', ...
    'VariableNames', {'Lower','Upper','Freq','RelFreq','CumFreq'});
disp(T)

% Median class: first class where cumulative frequency reaches n/2
medIdx = find(cum >= n/2, 1);
fprintf('Median class: %d-%d ms\n', edges(medIdx), edges(medIdx+1));
% Matches manual result: frequencies 3 8 10 9 8 2, median class 130-140

% Histogram
figure;
histogram(data, edges);
title('Histogram of API Response Times (40 Requests)');
xlabel('Response time (ms)');
ylabel('Frequency');
grid on;

% Cumulative frequency (less-than ogive) starting from 0 at the first edge
figure;
plot(edges, [0 cum], '-o', 'LineWidth', 1.5);
hold on;
yline(n/2, '--r', 'n/2 = 20');
hold off;
title('Less-than Ogive of API Response Times');
xlabel('Upper class boundary (ms)');
ylabel('Cumulative frequency');
legend('Cumulative frequency', 'Median position', 'Location', 'southeast');
grid on;
% The ogive crosses n/2 = 20 inside the 130-140 class, which agrees with
% the manual median class.