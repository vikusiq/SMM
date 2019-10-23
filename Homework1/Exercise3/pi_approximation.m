%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Truncation error in pi approximation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% In mathematics, the Leibnitz formula for pi, states that:
% It is obtained using Taylor formula for the tang 1 setting x = 1 since arctan(1) = pi / 4
% Fix n ? N and compute the approximation of ? using Leibnitz formula 
% truncated at n-th term. Compare the result with the true value of ?.
clear;
clc;
approximated_pi = 0;
n=500;
k_values = zeros(n,1);
absolute_error = zeros(n,1);
relative_error = zeros(n,1);
for k = 0 : n
   approximated_pi = approximated_pi + 4 * (-1)^k / (2*k +1) ; 
   fprintf('k = %i: approximated pi = %1.70f \n ', k, approximated_pi);
   k_values(k+1) = k;
   absolute_error(k+1) = abs(pi-approximated_pi);
   relative_error(k+1) = absolute_error(k+1) / abs(pi);    
end

subplot(1,2,1);
plot(k_values, absolute_error, 'r*');
title('Absolute error')

subplot(1,2,2);
plot(k_values, relative_error, 'g*');
title('Relative error')

% the error decreases with increasing n;



