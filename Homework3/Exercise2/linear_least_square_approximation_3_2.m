%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Linear least-squares for data approximation.
%   Given the least-squares problem: min||Ax ? b||^2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
clc;

%Test 1
x = [0.2; 337.4; 118.2; 884.6; 10.1; 226.5; 666.3; 996.3; 448.6; 777.0; 
    558.2; 0.4; 0.6; 775.5; 666.9; 338.0; 447.5; 11.6; 556.0; 228.1; 
    995.8; 887.6; 120.2; 0.3; 0.3; 556.8; 339.1; 887.2; 999.0; 779.0; 
    11.1; 118.3; 229.2; 669.1; 448.9; 0.5];
b = [0.1; 338.8; 118.1; 888.0; 9.2; 228.1; 668.5; 998.5; 449.1; 778.9; 
    559.2; 0.3; 0.1; 778.1; 668.8; 339.3; 448.9; 10.8; 557.7; 228.3; 998.0; 
    888.8; 119.6; 0.3; 0.6; 557.6; 339.3; 888.0; 998.5; 778.9; 10.2; 117.6; 
    228.9; 668.4; 449.2; 0.2];
                           
               
 
[M,N] = size(x);

A = [ones(M,1), x, x.^2, x.^3, x.^4];
%Computing and displaying the matrix condition number
condition_number = cond(A)

%computeing solution with the normal equations
%computation of A'A may be affected by a loss of significant
%digits, with a consequent loss of the positive definiteness of the matrix itself.
x_cholescky = inv(A'*A)*A'*b;

%computeing solution by using the pseudoinverse of A
psudo_solution_x =  pinv(A)*b;

%[Q,R]=qr(A);
%Qt=Q(: ,1:2); Rt=R(1:2 ,:);
%xstar = Rt \ (Qt'*b)

%GIven a data set of m data (xi, yi), i = 1, . . . m, 
%determine the least-squares polynomial approximation of degree n = 1, . . . 5 of the data

for i = 1 : 5
    p = polyfit(x,b,i);
    f = polyval(p,x);
    subplot(2,3,i)
    plot(x,b,'o', x,f,'-')
    title(join(["Least-Squares Polynomial Approximation of degree =", int2str(i)]))
    legend('data','linear fit')
    
    %Compute the R2 value:
    miu = mean(b);
    s0 = 0;
    s1 = 0;
    for j = 1 : M
        s0 = s0 + (b(j) - f(j))^2;
        s1 = s1 + (b(j) - miu)^2;   
    end
    R_squarded = 1 - (s0/s1);
    fprintf(["R2 value for Least-Squares Polynomial Approximation of degree %i is equal to %2.16f\n"],i , R_squarded);
    
end

