function [fxk, gxk, Hxk] = quadratic_convex(xk)
%ROSENBROCK Summary of this function goes here
%   Detailed explanation goes here
% INPUT:
% xk = scalar/vector in which the computation will be performed
% OUTPUT:
% fxk = computed value of the function in xk
% gxk = computed value of the gradiend og thr function in xk
% Hxk = computed Hessian matrix of the cuadratic convex function
gamma = 10;
fxk = (1/2*xk(1)^2 + gamma/2 * xk(2).^2 + gamma.^2/2 * xk(3).^2) - (xk(1) + xk(2) + xk(3));

gxk =zeros(3,1);
gxk(1,1) = xk(1) - 1;
gxk(2,1) = gamma * xk(2) - 1;
gxk(3,1) = gamma.^2 * xk(3) - 1;

Hxk = zeros(3);
Hxk(1,1) = 1;
Hxk(1,2) = 0;
Hxk(1,3) = 0;

Hxk(2,1) = 0;
Hxk(2,2) = gamma;
Hxk(2,3) = 0;

Hxk(3,1) = 0;
Hxk(3,2) = 0;
Hxk(3,3) = gamma.^2;

end


