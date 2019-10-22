function [xk, k, fxk, xk_values, vecf, vecg, exit_cond] = gradiend_method(x0,f, tol, kmax)
%GRADIEND METHOD 
%
% INPUT: 
% x0 - initial iterate
% f - function computing the objective function and its gradient
% tol - tolerance for the stopping rule
% kmax - maximum number of interations allowed
% 
% OUTPUT:
% xk = computed approximation of the stationary point
% k = number of performed iterations
% fxk = value of the function in xk
% xk_values - xk values computed during iterations
% vecf = vector of the function values along the iterations
% vecg = vector of the gradient norms along the iterations
% exit_cond = 1, 2, 3
% 
xk = x0;
k = 0;
rho = 1/2;  % for alpha decreasing
nu = 1.e-4; % euristic value
jmax = 20;  % from 20 to 50

% fxk = value of the function f in xk
% gxk = gradiend of the function f in xk
[fxk, gxk, Hxk] = f(xk);

vecf = zeros(kmax+1, 1);        vecf(1) = fxk;
vecg = zeros(kmax+1, 1);        vecg(1) = norm(gxk);
[r,c] = size(x0);
xk_values = zeros(kmax+1, r);   xk_values(1,:) = xk;

c = 1;
while norm(gxk) > tol && k<kmax
   pk = -gxk;           % descent direction
   
   if c
       alpha_k = 1;     % constant step lengh
       % implementing backtracking procedure for linesearch (armijo algorithm)
       j = 0;
       %f(xk + alpha_k * pk)
       %pause
       while f(xk + alpha_k * pk) > fxk + alpha_k*nu*pk'*gxk  % stopping condition for backtracking loop
           alpha_k = alpha_k * rho;
           j = j + 1;
           if j>jmax
               fprintf('linesearch failed \n');
               exit_cond = 3;
               return
           end      
       end
   end
   xk = xk + alpha_k * pk; % update of the iterate 
   k = k + 1;
   [fxk, gxk, Hxk] = f(xk);   
   vecf(k+1) = fxk;
   vecg(k+1) = norm(gxk);
   xk_values(k+1,:) = xk;
end

if norm(gxk) <= tol
    exit_cond = 1;
else
    exit_cond = 2;
end
end

