clear;
clc;
close

% Parameters
a = 6;
b = 6;

% Initial condition
x(1) = 0.2;
y(1) = 0.3;


ite = 0:0.002:1;
iterations=length(ite);
for j = 1:iterations
    
    new_x=mod((exp(b)+a^2)*(x(j)+y(j)^2)/(1+a^2),1);
    new_y=mod((exp(a)+b^2)*y(j)/(1+b^2),1);
    
    x(j+1) = new_x;
    y(j+1) = new_y;
end



figure(1)
 for i = 2:length(x)
        plot([x(i-1), x(i-1)], [x(i-1), x(i)],'-','color', [0.6350 0.0780 0.1840]);
        hold on;
        plot([x(i-1), x(i)], [x(i), x(i)], '-','color', [0.6350 0.0780 0.1840]);
 end
    plot(x, x, '--','color', [0.6350 0.0780 0.1840]);
    set(gca,'YTick',[0:0.2:1]);
    set(gca,'XTick',[0:0.2:1]);
    xlabel('\itx_{i-\rm1}');
    ylabel(['\itx_i']);
    axis square;
    grid on;
    set(gca, 'FontName','Times New Roman','FontSize',12,'FontWeight','bold');


figure(2)
 for i = 2:length(y)
        plot([y(i-1), y(i-1)], [y(i-1), y(i)],'-','color', [0 0.4470 0.7410]);
        hold on;
        plot([y(i-1), y(i)], [y(i), y(i)], '-','color', [0 0.4470 0.7410]);
 end
    plot(y, y, '--','color', [0 0.4470 0.7410]);
    set(gca,'YTick',[0:0.2:1]);
    set(gca,'XTick',[0:0.2:1]);
    xlabel('\ity_{i-\rm1}');
    ylabel(['\ity_i']);
    axis square;
    grid on;
    set(gca, 'FontName','Times New Roman','FontSize',12,'FontWeight','bold');
