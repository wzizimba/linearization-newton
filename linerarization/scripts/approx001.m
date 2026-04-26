% This script demonstartes the use of the lin.m funtion to approximate the values of:
%        (0.95)^(1/3) and (1.1)^(1/3)

func_dir = fileparts(mfilename('fullpath')); 
addpath(fullfile(func_dir,'..','src'));   % code function, lin.m, call automation

syms x

f_s='(1-x)^(1/3)';
a=0;

L=lin(f_s,a);

%                                 Approximations

%  (0.95)^(1/3) = (1-0.05)^(1/3); x=0.05      
x1=0.05;
appr1=double(subs(L,symvar(L),x1));
exct1=(0.95)^(1/3);

% (1.1)^(1/3) = (1-(-0.1))^(!/3); x=-0.1
x2=-0.1;
appr2=double(subs(L,symvar(L),x2));
exct2=(1.1)^(1/3);

fprintf('Approximations');
fprintf('(0.95)^(1/3): L(0.05) = %.6f ; Exact = %.6f ; Error = %.2e\n' ...
    ,appr1,exct1,abs(appr1-exct1));
fprintf('(1.1)^(1/3): L(-0.1) = %.6f ; Exact = %.6f ; Error = %.2e\n', appr2,exct2,abs(appr2-exct2));
