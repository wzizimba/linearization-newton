% This script takes in a function as input, f_s, and outputs a symbolic linear function
% Demostrative funtion:
%              f(x) = (1-x)^(1/3)
% at x=0

func_dir = fileparts(mfilename('fullpath'));
addpath(fullfile(func_dir,'..','src'));   % code function, lin.m, call automation

syms x

f_s=('(1-x)^(1/3)');
a=0;

L=lin(f_s,a);

fprintf('f(x) = (1-x)^(1/3)');
fprintf('x = %d\n',a);
fprintf('L(x) = ');
disp(L)
