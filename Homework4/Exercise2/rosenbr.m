function [fxk, gxk, Hxk] = rosenbr(xk)
%ROSENBROCK Summary of this function goes here
%   Detailed explanation goes here
% INPUT:
% xk = scalar/vector in which the computation will be performed
% OUTPUT:
% fxk = computed value of the function in xk
% gxk = computed value of the gradiend of the function in xk
% Hkh = Hessian matrix of the function

fxk = 100*(xk(2) - xk(1)^2)^2 + (1 - xk(1))^2;

gxk =zeros(2,1);
gxk(1,1) = 400*(xk(1)^3 - xk(1) * xk(2)) + 2*(xk(1) - 1) ;
gxk(2,1) = 200*(-xk(1)^2 + xk(2)); 

Hxk = zeros(2,2);
Hxk(1,1) = 400*(3*xk(1)^2 - xk(2)) + 2;
Hxk(1,2) = -400 * xk(1);
Hxk(2,1) = -400 * xk(1);
Hxk(2,2) = 200;
end

