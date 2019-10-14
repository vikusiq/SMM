%Use the Matlab functions eps, realmax, realmin
%assuming that ? = 2 (base)
%to compute the  Floating Point Systems parameters: 
%t - precision
t = 1 - log2(eps);
%[L,U] - exponent range 
L = log2(realmin) + 1;
U_inf = log2(realmax/(1-2^-t));
U = log2(realmax/(2-2^(-t+1)))+1;

UFL = 2^L;
OFL = (2 - 2^(-t+1))*2^U;

fprintf(['----------------------------------------------------------\n', ...
        'MATLAB FLOATING POINT SYSTEM\n ', ...
        'F(2,t,L,U) \n', ...
        '----------------------------------------------------------\n', ...
        'UFL = %d\n' ,...
        'OFL = %d\n', ...
        'Precisione Macchina = \n', ...
        't = %d \n', ...
        'L = %d \n',...
        'U = %d \n'], UFL, OFL, t, L, U);

%---------------------------------------------------------
%MATLAB FLOATING POINT SYSTEM
%F(2,t,L,U)
%----------------------------------------------------------
%UFL =  4.450147717014403e-308
%OFL =  1.797693134862316e+308
%Precisione Macchina = 
%t = 53
%L = -1021
%U = 1024
%---------------------------------------------------------



%Tips:
%Given the Floating Point system F(?, t, L, U), you know that:
%epsilon_machine = ?^(1?t) - (by chopping)
%UFL = ?^L
%OFL = (? ? ?^(?t+1))?^U
%Can you get t from the expression of epsilon_mach?
