%% Question 3: Frequency Distribution of a Discrete Variable
clear; clc; close all;

%% Manual Work (answers from paper, for comparison)
% Manual frequencies for 2..8 = 5 6 6 6 4 2 1
% Manual modes = 3, 4, 5 (trimodal)

%% MATLAB Work
data = [2 4 3 5 2 6 4 3 5 7 4 2 3 6 5 4 3 8 2 5 6 4 3 5 7 4 2 6 5 3];
n = numel(data);

% Frequency distribution
vals = unique(data);
freq = histcounts(data, [vals, vals(end)+1]);

% Relative and cumulative frequency
rel = freq / n;
cum = cumsum(freq);

% Display as a table
T = table(vals', freq', rel', cum', ...
    'VariableNames', {'Defects','Freq','RelFreq','CumFreq'});
disp(T)

% Mode: mode() returns only ONE value (the smallest of the tied modes)
fprintf('mode() gives: %d\n', mode(data));
% All modes: every value whose frequency equals the maximum frequency
allModes = vals(freq == max(freq));
fprintf('All modes: %s\n', mat2str(allModes));
% The data is trimodal (3, 4, 5), but mode() reports only 3,
% so we use freq == max(freq) to find all the modes.

% Bar chart of the frequency distribution
figure;
bar(vals, freq);
title('Frequency Distribution of Software Defects in 30 Modules');
xlabel('Number of defects');
ylabel('Frequency (number of modules)');
grid on;

% Comparison: MATLAB frequencies 5 6 6 6 4 2 1 match the manual table,
% and relative frequencies sum to 1.