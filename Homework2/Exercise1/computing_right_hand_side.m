function[x, b]= computing_right_hand_side(A)
%UNTITLED4 Summary of this function goes here
%   Computint the result of multiplying given A and 
%   the exact solution - column vector of ones.
n = size(A);
x = ones(n(2),1);
b = A * x;
end

