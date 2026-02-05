
 clear;
clc;
close


%% 2D-PPMCM------------------------------------------------------------------------------------------------------------
% Parameters
a = 6;
b = 6;

% Initial condition
x(1) = 0.2;
y(1) = 0.3;


iterations=10000;

for j = 1:iterations
    
    new_x=mod((exp(b)+a^2)*(x(j)+y(j)^2)/(1+a^2),1);
    
    new_y=mod((exp(a)+b^2)*y(j)/(1+b^2),1);

   
    x(j+1) = new_x;
    y(j+1) = new_y;
end


figure(1)
subplot(2,1,1)
histogram(x,'FaceColor', [1.0, 0.7, 0.75], 'EdgeColor',[0, 0, 0]);
xlabel('\itx'); ylabel('Frequency');

 set(gca,'XTick',[0:0.1:1]);
set(gca,'FontName','Times New Roman','FontSize',12,'FontWeight','bold');
grid on
subplot(2,1,2)
histogram(y,'FaceColor', [1.0, 0.7, 0.75], 'EdgeColor',[0, 0, 0]);
xlabel('\ity'); ylabel('Frequency');

 set(gca,'XTick',[0:0.1:1]);
set(gca,'FontName','Times New Roman','FontSize',12,'FontWeight','bold');
grid on
