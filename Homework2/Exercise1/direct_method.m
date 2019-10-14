format long e;

% Test 1
j = 0;
computational_time = zeros(20,1);
n_array = zeros(20,1);
relative_errors_array = zeros(20,1);
conditioning_numbers_array = zeros(20,1);

for i = 10:50:1000
    j = j+1;  
    
    %randomly generating input matrix A
    A = randn(i);   
    %fprintf('\n\nrandomly generated A = \n');
    %disp(A);
    %pause   
    
    %measuring the computationaltime
    tic    
    %x = ones(i,1);
    %b = A * x;
    [x, b] = computing_right_hand_side(A);   
    %fprintf('\n\nb = \n');
    %disp(b);
    %pause    
    conditioning_number = cond(A);
    %conditioning_number = computing_condition_number(A);
    
    %fprintf('\n\nconditioning_number = \n');
    %disp(conditioning_number);
    %pause  
    
    %solving linear system Ax=b
    aproximates_x = A \ b;    
    relative_error = norm(x - aproximates_x) / norm(x);
    %fprintf('\n\nrelative_error = \n');
    %disp(relative_error);
    %pause        
    n_array(j) = i;
    computational_time(j) = toc;
    relative_errors_array(j) = relative_error;
    conditioning_numbers_array(j) = conditioning_number; 
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
    tic    
    [x, b] = computing_right_hand_side(A);   
    conditioning_number = computing_condition_number(A);
    aproximates_x = A \ b;
    relative_error = norm(x - aproximates_x) / norm(x);    
    
    n_array(j) = i;
    computational_time(j) = toc;
    relative_errors_array(j) = relative_error;
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
    
    %randomly generating input matrix A
    A = randn(i); 
    symmetric_positive_definite = A'*A;
    
    %measuring the computationaltime
    tic
    [x, b] = computing_right_hand_side(symmetric_positive_definite);    
    conditioning_number = computing_condition_number(symmetric_positive_definite);
    
    %solving linear system Ax=b
    aproximates_x = symmetric_positive_definite \ b;    
    relative_error = norm(x - aproximates_x) / norm(x);    
    n_array(j) = i;
    computational_time(j) = toc;
    relative_errors_array(j) = relative_error;
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
    tic    
    [x, b] = computing_right_hand_side(A);   
    conditioning_number = computing_condition_number(A);
    aproximates_x = A \ b;
    relative_error = norm(x - aproximates_x) / norm(x);
    
    n_array(j) = i;
    computational_time(j) = toc;
    relative_errors_array(j) = relative_error;
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




