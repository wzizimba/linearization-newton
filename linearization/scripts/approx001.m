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

%                            Plots

% Wide View
figure(1);
xp=linspace(-1,1.5,500);
yf=real(ffn(xp));
yL=lfn(xp);
plot(xp,yf,'-','Color',[0 0 0],'LineWidth',2,'DisplayName','f(x) = (1-x)^{1/3}');
hold on;

plot(xp,yL,'--','Color',[.45 .45 .45],'LineWidth',1.8,'DisplayName','L(x) = 1-x/3');
plot(x1,appr1,'o','Color',[.30 .30 .30],'MarkerSize',7,'MarkerFaceColor',[.30 .30 .30],'DisplayName',sprintf('L(0.05) = %.4f [approx 0.95^{1/3}]',appr1));
plot(x2,appr2,'o','Color',[.55 .55 .55],'MarkerSize',7,'MarkerFaceColor',[.55 .55 .55],'DisplayName',sprintf('L(-0.1) = %.4f [approx 1.1^{1/3}]',appr2));
plot(x1,exct1,'o','Color',[.70 .70 .70],'MarkerSize',7,'MarkerFaceColor',[.70 .70 .70],'DisplayName',sprintf('Exact 0.95^{1/3} = %.4f,',exct1));
plot(x2,exct2,'o','Color',[.85 .85 .85],'MarkerSize',7,'MarkerFaceColor',[.85 .85 .85],'DisplayName',sprintf('Exact 1.1^{1/3} = %.4f,',exct2));
plot(0,1,'o','Color',[0 0 0],'MarkerSize',8,'DisplayName','Tangent point (0, 1)');

xlabel('x');
ylabel('y');
title('Wide View of Linearization Plot at x = 0');
legend('Location','northeast'); 
grid on;
hold off;

% Zoom around x=0.05
figure(2);
xp2=linspace(-0.1,0.15,300);
plot(xp2,real(ffn(xp2)),'-','Color',[0 0 0],'LineWidth',2,'DisplayName','f(x)');
hold on;
plot(xp2,lfn(xp2),'--','Color',[.45 .45 .45],'LineWidth',1.8,'DisplayName','L(x)');
plot(x1,appr1,'o','Color',[.30 .30 .30],'MarkerSize',10,'MarkerFaceColor',[.30 .30 .30],'DisplayName',sprintf('L(0.05) = %.6f',appr1));
plot(x1,exct1,'o','Color',[.70 .70 .70],'MarkerSize',8,'MarkerFaceColor',[.70 .70 .70],'DisplayName',sprintf('0.95^{1/3} = %.6f',exct1));
xlabel('x');
ylabel('y');
title('Zoom View of Approximation for: 0.95^{1/3} at x = 0.05');
legend('Location','northeast');
grid on;
hold off;

% Zoom around x = -0.1
figure(3);
xp3=linspace(-0.25,0.05,300);
plot(xp3,real(ffn(xp3)),'-','Color',[0 0 0],'LineWidth',1.8,'DisplayName', 'f(x)');
hold on;
plot(xp3,lfn(xp3),'--','Color',[.45 .45 .45],'LineWidth',1.8, 'DisplayName','L(x)'); 
plot(x2,appr2,'o','Color',[.55 .55 .55],'MarkerSize',10,'MarkerFaceColor',[.55 .55 .55],'DisplayName',sprintf('L(-0.1) = %.6f', appr2));
plot(x2,exct2,'o','Color',[.70 .70 .70],'MarkerSize',8,'MarkerFacecolor',[.70 .70 .70],'DisplayName',sprintf('L(-0.1) = %.6f', exct2));
xlabel('x');
ylabel('y');
title('Zoom View of 1.1^{1/3} at x = -0.1');
legend('Locatin','northwest');
grid on;
hold off;


