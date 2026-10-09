# MATLAB-Assignment1

MATLAB scripts for **Assignment No. 01** of **Statistics and Probability Theory** (BS Software Engineering, COMSATS University Islamabad).

Each question was solved manually first. The MATLAB script then reproduces the calculations and graphs, and a comment in each script compares the output with the manual result.

## Author

**Maida Amjad**

## Files

| File | Topic | Main MATLAB tools |
|------|-------|-------------------|
| `q1.m` | Types of variables, measurement scales and measurement error | `table`, `abs`, `mean`, `histogram` |
| `q2.m` | Data collection and sampling (simple random, stratified, systematic) | `randperm`, `randi`, `round`, `cumsum` |
| `q3.m` | Frequency distribution of a discrete variable | `unique`, `histcounts`, `cumsum`, `bar` |
| `q4.m` | Grouped frequency distribution and cumulative frequency | `histcounts`, `histogram`, ogive plot |
| `q5.m` | Histogram, frequency polygon and cumulative frequency curve | `histogram`, `plot`, class midpoints |
| `q6.m` | Stem-and-leaf display and central tendency | `mean`, `median`, `mode`, `boxplot` |
| `q7.m` | Simple mean, weighted mean and median | `.*`, `sum`, `bar`, `yline` |

## Results

| Question | Key results |
|----------|-------------|
| Q1 | Mean absolute error = 0.14 months |
| Q2 | Stratified sample sizes = 6, 5, 7, 6 (total 24); systematic interval k = 10 |
| Q3 | Frequencies = 5, 6, 6, 6, 4, 2, 1; modes = 3, 4, 5 (trimodal) |
| Q4 | Sturges k = 6.32, so 6 classes of width 10; frequencies = 3, 8, 10, 9, 8, 2; median class = 130-140 |
| Q5 | Frequencies = 3, 7, 10, 12, 12, 6; distribution is left-skewed |
| Q6 | Mean = 27.76, median = 27, modes = 21, 24, 28; mildly right-skewed |
| Q7 | Simple mean = 82.25, weighted mean = 82.35, median = 80, mode = 74 |

## How to run

1. Download or clone this repository.
2. Open MATLAB (desktop or [MATLAB Online](https://matlab.mathworks.com/)).
3. Open any script, for example `q1.m`, and click **Run**.
4. The results appear in the Command Window and the figures open in separate windows.

Each script begins with `clear; clc; close all;`, so every file can be run on its own.

## Notes

- **Q1:** the question gives only 5 of the 12 development times, so the remaining values are dummy data. This is stated in a comment in the script.
- **Q2:** `rng(1)` fixes the random seed so the selected IDs are the same every time. Remove it to get a new random sample on each run.
- **Q3 and Q6:** MATLAB's `mode()` returns only one value when there are ties, so the scripts also find all the modes using the maximum frequency.
- **Q6:** the stem-and-leaf display is written as a short loop, because MATLAB has no built-in text command for it. `boxplot` needs the Statistics and Machine Learning Toolbox.

## Tools

- MATLAB Online

## Video explanation

[Add your YouTube link here]
