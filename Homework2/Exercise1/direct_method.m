%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Numerical solution of linear systems
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
format long e;
clear;
clc;
% Test 1
j = 0;
computational_time = zeros(20,1);
n_array = zeros(20,1);
relative_errors_array = zeros(20,1);
conditioning_numbers_array = zeros(20,1);
for i = 10:50:1000
    j = j+1;          
    A = randn(i);               %randomly generating input matrix A
    [x, b] = computing_right_hand_side(A); 
    tic                         %measuring the computationaltime    
    aproximates_x = A \ b;      %solving linear system Ax=b
    computational_time(j) = toc;      
    n_array(j) = i;    
    relative_errors_array(j) = norm(x - aproximates_x) / norm(x);
    conditioning_numbers_array(j) = cond(A); 
end
figure(1)
subplot(2,2,1)
plot(n_array, computational_time, 'b')
title('Computational time')

subplot(2,2,3)
loglog(n_array, relative_errors_array, 'r')
title('Relative errors')

subplot(2,2,4)
loglog(n_array, conditioning_numbers_array, 'g')
title('Conditioning numbers')


% Test 2
j = 0;
computational_time = zeros(6,1);
n_array = zeros(6,1);
relative_errors_array = zeros(6,1);
conditioning_numbers_array = zeros(6,1);

for i = 5:5:30
    j = j+1;
    A = vander([i,1]);         
    [x, b] = computing_right_hand_side(A);   
    conditioning_number = computing_condition_number(A);
    tic
    aproximates_x = A \ b;
    computational_time(j) = toc;  
    n_array(j) = i;    
    relative_errors_array(j) = norm(x - aproximates_x) / norm(x);
    conditioning_numbers_array(j) = conditioning_number;
end

figure(2)

subplot(2,2,1)
plot(n_array, computational_time, 'b')
title('Computational time')

subplot(2,2,3)
loglog(n_array, relative_errors_array, 'r')
title('Relative errors')

subplot(2,2,4)
loglog(n_array, conditioning_numbers_array, 'g')
title('Conditioning numbers')


% Test 3
j = 0;
computational_time = zeros(20,1);
n_array = zeros(20,1);
relative_errors_array = zeros(20,1);
conditioning_numbers_array = zeros(20,1);

for i = 10:50:1000
    j = j+1;
    A = randn(i); 
    symmetric_positive_definite = A'*A;  
    [x, b] = computing_right_hand_side(symmetric_positive_definite);    
    conditioning_number = computing_condition_number(symmetric_positive_definite);
    tic
    aproximates_x = symmetric_positive_definite \ b;  
    computational_time(j) = toc; 
    n_array(j) = i;
    relative_errors_array(j) = norm(x - aproximates_x) / norm(x);
    conditioning_numbers_array(j) = conditioning_number;
end

figure(3)
subplot(2,2,1)
plot(n_array, computational_time, 'b')
title('Computational time')

subplot(2,2,3)
loglog(n_array, relative_errors_array, 'r')
title('Relative errors')

subplot(2,2,4)
loglog(n_array, conditioning_numbers_array, 'g')
title('Conditioning numbers')


% Test 4
j = 0;
computational_time = zeros(9,1);
n_array = zeros(9,1);
relative_errors_array = zeros(9,1);
conditioning_numbers_array = zeros(9,1);

for i = 4:1:12
    j = j+1;
    A = hilb(i);
    [x, b] = computing_right_hand_side(A);   
    conditioning_number = computing_condition_number(A);
    tic
    aproximates_x = A \ b;
    computational_time(j) = toc;
    n_array(j) = i;
    relative_errors_array(j) = norm(x - aproximates_x) / norm(x);
    conditioning_numbers_array(j) = conditioning_number;
    
end
figure(4)

subplot(2,2,1)
plot(n_array, computational_time, 'b')
title('Computational time')

subplot(2,2,3)
loglog(n_array, relative_errors_array, 'r')
title('Relative errors')

subplot(2,2,4)
loglog(n_array, conditioning_numbers_array, 'g')
title('Conditioning numbers')





