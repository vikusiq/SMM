%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Numerical optimization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   The gradient method with constant step length ?
%   and step length ? computed by backtracking procedure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
clc; 

x0 = [5;-5;10];
tol = 1e-5;
kmax = 1e5;

[xk, k, fxk, xk_values, vecf, vecg, exit_cond] = gradiend_method(x0,@quadratic_convex, tol, kmax);

%[xk, k, fxk, xk_values, vecf, vecg, exit_cond] = newton_method(x0,@quadratic_convex, tol, kmax);


% plotting graphs with the norm of error as function of the iteration k
figure(1);
k_values = linspace(1,k+1, k+1);
xk_vector = ones(k+1,3);
for i = 1 : k + 1
    xk_vector(i,1) = xk_vector(i,1) .* xk(1);
    xk_vector(i,2) = xk_vector(i,2) .* xk(2);
    xk_vector(i,3) = xk_vector(i,3) .* xk(3);
    
    norm_err(i) = norm(xk_vector(i,:) - xk_values(i,:));   
    vec_f(i) = vecf(i);
    vec_g(i) = vecg(i);       
end
figure(1)
plot(k_values, norm_err);
title('Norm error: ')

% the function values as function of the iteration k
figure(2);
plot(k_values, vec_f, '*');
title('Function values: ')


% gradient norms as function of the iteration k
figure(3);
plot(k_values, vec_g, '*');
title('Gradient norms: ')





