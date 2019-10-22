%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Numerical optimization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   The gradient method with constant step length ?
%   and step length ? computed by backtracking procedure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
clc; 

x0 = [5;5];
tol = 1e-5;
kmax = 1e5;
[xk, k, fxk, xk_values, vecf, vecg, exit_cond] = gradiend_method(x0,@rosenbr, tol, kmax);

%[xk, k, fxk, xk_values, vecf, vecg, exit_cond] = newton_method(x0,@rosenbr, tol, kmax);


% plotting graphs with the norm of error as function of the iteration k
figure(1);
k_values = linspace(1,k+1, k+1);
xk_vector = ones(k+1,2);
for i = 1 : k + 1
    xk_vector(i,1) = xk_vector(i,1) .* xk(1);
    xk_vector(i,2) = xk_vector(i,2) .* xk(2);    
    norm_err(i) = norm(xk_vector(i,:) - xk_values(i,:));    
    
    norm_err(i) = norm(xk_vector(i,:) - xk_values(i,:));   
    vec_f(i) = vecf(i);
    vec_g(i) = vecg(i);    
end
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






