%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   e approximation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Computing sequence an for different values of n: 10, 100, 1000...10e17
clc;
clear;
format long e;
n = logspace(1,17,17);  %n = [10, 100, 1000, ..., 10e17]
e = exp(1);
a_n = zeros(1,17);
absolute_error = zeros(1,17);
for i = 1 : 17
    a_n(i) = (1 + (1/n(i)))^n(i);   %when i becomes 16 -> 1/10.^16 < eps(1)
    absolute_error(i) = abs(a_n(i) - e);
end

e
a_n'
absolute_error'

subplot(1,2,1)
plot(a_n);
title('a_n values for n = 10..10e17')

subplot(1,2,2)
plot(absolute_error);
title('absolute error')
%plot(n,error)



%eps(1) = 2.220446049250313e-16 > 1/10.^16