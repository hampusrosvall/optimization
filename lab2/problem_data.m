function [ A, b, f ] = problem_data()
%PROBLEM_DATA Summary of this function goes here
%   Detailed explanation goes here
A = [1 1 3; 3 1 5; 2 1 3; eye(3)];
b = [2 4 3 zeros(1,3)]';
c = [30, 24, 60]; 
f = @(x) c(1)*x(1) + c(2)*x(2) + c(3)*x(3);
end

