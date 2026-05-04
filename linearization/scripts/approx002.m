% Furthur demostration of the function, lin(), to find the tnagent-line approximations
% of:
%    f(x) = (x-1)^", g(X) = e^(-2x) and h(x) = 1+ln(1-2x)
% at a = 0

func_dir = fileparts(mfilename('fullpath'));func_dir = fileparts(mfilename('fullpath'));
addpath(fullfile(func_dir,'..','src'));   % code function, lin.m, call automation

a = 0;

Lf=lin('(x-1)^2', a);
Lg=lin('exp(-2*x)', a);
Lh=lin('1+log(1-2*x)', a);

fprintf('f(x) -  Lf(x) = ');
disp(Lf);
fprintf('g(x) -  Lg(x) = ');
disp(Lg);
fprintf('h(x) -  Lh(x) = ');
disp(Lh);

