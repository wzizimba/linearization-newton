% Furthur demostration of the function, lin(), to find the tnagent-line approximations
% of:
%    f(x) = (x-1)^", g(X) = e^(-2x) and h(x) = 1+ln(1-2x)
% at a = 0

func_dir = fileparts(mfilename('fullpath'));func_dir = fileparts(mfilename('fullpath'));
addpath(fullfile(func_dir,'..','src'));   % code function, lin.m, call automation

% Computation of Linearizations
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

% function handles
ffn=@(t) (t-1).^2;
gfn=@(t) exp(-2*t);
hfn=@(t) 1+log(1-2*t);
Lfn=@(t) 1-2*t;

%                                           Plot

figure(1); 
clf;
xp=linspace(-0.6,0.49,600);

plot(xp,ffn(xp), '-','Color',[0 0 0],'LineWidth',1.7,'DisplayName','f(x) = (x-1)^2');
hold on;
plot(xp,gfn(xp), '-','Color',[.4 .5 .6],'LineWidth',1.7,'DisplayName','g(x) = exp(-2x)');
plot(xp,hfn(xp), '-','Color',[.30 .30 .30],'LineWidth',1.7,'DisplayName','h(x) = 1 + lin(1-2x)');
plot(xp,Lfn(xp), '--','Color',[1 0 0],'LineWidth',1.7,'DisplayName','L(x) = 1-2x');









