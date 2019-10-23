%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Computing The Floating Point Systems parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Use the Matlab functions eps, realmax, realmin, assuming that base = 2 
% to compute the  Floating Point Systems parameters: 
clear;
clc;
% t - precision:
t = 1 - log2(eps);
%[L,U] - exponent range 
L = log2(realmin) + 1;
%U_inf = log2(realmax/(1-2^-t));
U = log2(realmax/(2-2^(-t+1)))+1;

UFL = 2^L;
OFL = (2 - 2^(-t+1))*2^U;

fprintf(['----------------------------------------------------------\n', ...
        'MATLAB FLOATING POINT SYSTEM\n ', ...
        'F(2,t,L,U) \n', ...
        '----------------------------------------------------------\n', ...
        'realmin = %d\n' ,...
        'realmax = %d\n' ,...
        'UFL = %d\n' ,...
        'OFL = %d\n', ...
        'Precisione Macchina = %d\n', ...
        't = %d \n', ...
        'L = %d \n',...
        'U = %d \n'],realmin, realmax, UFL, OFL, eps, t, L, U);

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
