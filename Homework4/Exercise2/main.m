%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Numerical optimization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   The gradient method with constant step length ?
%   and step length ? computed by backtracking procedure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
clc; 

x0 = [10,10];
tol = 1e-5;
kmax = 1e5;
%[xk, k, fxk, vecf, vecg, exit_cond] = gradiend_method(x0,@rosenbr, tol, kmax);

[xk, k, fxk, vecf, vecg, exit_cond] = newton_method(x0,@rosenbr, tol, kmax);