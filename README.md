# Octave Lab Exercises

This repository contains implementations of basic programming, algorithms, and numerical methods in Octave.

## Contents
- Matrix multiplication (manual)
- Bisection method
- Bubble sort, Merge sort, Quick sort
- Binary search
- Recursive factorial
- Palindrome checker
- Mean, Median, Mode calculator

## Running
```octave
octave> result = matrix_multiply([1 2; 3 4], [5 6; 7 8])
octave> root = bisection_method(@(x) x^2 - 2, 0, 2, 1e-5, 100)
