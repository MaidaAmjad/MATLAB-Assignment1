%% Question 2: Data Collection and Sampling
clear; clc; close all;

%% Manual Work (answers from paper, for comparison)
% Manual stratified sample sizes = 6, 5, 7, 6 (total 24)
% Manual systematic interval k = 240/24 = 10

%% MATLAB Work
rng(1);                          % fixed seed so results repeat
sizes = [60 50 70 60];           % sections A, B, C, D
N = sum(sizes);
n = 24;

% Proportional allocation
n_strat = round(n * sizes / N);
fprintf('Stratified sample sizes (A B C D): %s\n', mat2str(n_strat));
fprintf('Total = %d\n', sum(n_strat));
% Matches manual result: 6 5 7 6

% Simple random sample of 24 IDs from 1 to 240
srs_ids = sort(randperm(N, n));
disp('Simple random sample IDs:');
disp(srs_ids);

% Stratified sample: IDs inside each section
% Section ranges: A = 1-60, B = 61-110, C = 111-180, D = 181-240
offsets = [0, cumsum(sizes(1:end-1))];
names = {'A','B','C','D'};
for i = 1:4
    ids = sort(randperm(sizes(i), n_strat(i))) + offsets(i);
    fprintf('Section %s IDs: %s\n', names{i}, mat2str(ids));
end

% Systematic sample
k = N / n;                       % interval = 10
start = randi(k);                % random start between 1 and k
sys_ids = start : k : N;
fprintf('Systematic sample (start = %d, k = %d):\n', start, k);
disp(sys_ids);
fprintf('Number of IDs selected = %d\n', numel(sys_ids));
% Matches manual method: k = 10 and 24 students selected