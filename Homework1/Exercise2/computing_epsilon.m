%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Computing the machine precision epsilon
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% using its alternative definition: fl(1 + epsilon) > 1
% for single precision:
clear;
clc;
x = 1;
i = 1;
x_single_values = zeros(20, 1);
idx_single_values = zeros(20, 1);
while 1 + single(x) > 1    
    x_single_values(i) = x;
    idx_single_values(i) = i;
    i = i+1;
    x = x / 2;   
end
single_precision_eps = x*2;
subplot(1,2,1);
plot(idx_single_values, x_single_values, 'g*');
title('single precision epsilon:')

%for double precision:
x = 1;
i = 1;
x_double_values = zeros(50,1);
idx_double_values = zeros(50,1);
while 1 + x > 1    
    x_double_values(i) = x;
    idx_double_values(i) = i;
    i = i+1;
    x = x / 2;   
end
double_precision_eps = x*2;
subplot(1,2,2);
plot(idx_double_values, x_double_values, 'r*');
title('double precision epsilon:')

%Printing results: 
fprintf(['----------------------------------------------------------\n', ...
        'Computed machine precision epsilon:\n', ...
        '----------------------------------------------------------\n', ...
        'for single precision: = %d\n' ,...
        'for double precision: = %d\n'], single_precision_eps, double_precision_eps);


%Tips:
%Use a while structure. To set a single precision use the function single.