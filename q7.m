%% Question 7: Arithmetic Mean, Weighted Mean and Median
clear; clc; close all;

%% Manual Work (answers from paper, for comparison)
% Manual simple mean = 329/4 = 82.25
% Manual weighted mean = 82.35/1.00 = 82.35
% Manual median of coding tests = (79 + 81)/2 = 80
% Manual mode of coding tests = 74

%% MATLAB Work
courses = {'Programming', 'Statistics', 'Software Eng.', 'Database'};
marks   = [78 84 91 76];
w       = [0.30 0.25 0.25 0.20];
scores  = [62 70 74 74 79 81 85 88 90 95];

% Simple and weighted means
simpleMean   = mean(marks);
weightedMean = sum(marks .* w) / sum(w);

% Median and mode of the coding-test scores
medScores = median(scores);
modScores = mode(scores);

% Display results in the Command Window
fprintf('Sum of weights         = %.2f\n', sum(w));
fprintf('Simple mean            = %.2f\n', simpleMean);
fprintf('Weighted mean          = %.2f\n', weightedMean);
fprintf('Median (coding tests)  = %g\n', medScores);
fprintf('Mode (coding tests)    = %d\n', modScores);
% Matches manual results: 82.25, 82.35, 80 and 74

% Bar chart of the four course marks
figure;
bar(marks);
set(gca, 'XTickLabel', courses);
title('Course Marks of the Software Engineering Student');
xlabel('Course');
ylabel('Marks');
ylim([0 100]);
grid on;

% Horizontal lines showing the simple and weighted means
hold on;
yline(simpleMean, '--r', 'LineWidth', 1.5);
yline(weightedMean, '-.g', 'LineWidth', 1.5);
hold off;
legend('Marks', 'Simple mean (82.25)', 'Weighted mean (82.35)', ...
    'Location', 'northeastoutside');

% The weighted mean (82.35) is slightly higher than the simple mean (82.25)
% because the higher marks (Statistics 84, Software Eng. 91) carry larger
% weights than Database Systems (76). The weighted mean reflects each
% course's real importance, so it is more appropriate for an overall score.