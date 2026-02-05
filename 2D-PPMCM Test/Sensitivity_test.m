%% 初值敏感性
clc;
clear;


a=6;b=6;

x(1)=0.2;y(1)=0.3;
for i=1:250
    x(i+1)=mod((exp(b)+a^2)*(x(i)+y(i)^2)/(1+a^2),1);
    y(i+1)=mod((exp(a)+b^2)*y(i)/(1+b^2),1);
end
  
 
hold on;


h(1)=0.2+10^(-15);j(1)=0.3+10^(-15);a2=6;b2=6;

for i=1:250
    h(i+1) = mod((exp(b2)+a2^2)*(h(i)+j(i)^2)/(1+a2^2),1);
    j(i+1) = mod((exp(a2)+b2^2)*j(i)/(1+b2^2),1);
end

w(1)=0.2;z(1)=0.3;a1=6+10^(-15);b1=6+10^(-15);

for i=1:250

    w(i+1) = mod((exp(b1)+a1^2)*(w(i)+z(i)^2)/(1+a1^2),1);
    z(i+1) = mod((exp(a1)+b1^2)*z(i)/(1+b1^2),1);
end





q=x-w;
s=y-z;
figure(1)
plot(0:50,x(1:51),'-p','color', [0.6350 0.0780 0.1840],'LineWidth', 1.5,'Markersize',5);
plot(0:50,y(1:51),'.-','color', [0 0.4470 0.7410],'LineWidth', 1.5,'Markersize',20);
 set(gca,'YTick',[-1:0.5:1]);
% xticks([0,0.2,0.4,0.6,0.8,1]);
% yticks([0,10,20,30,40,50]);
legend('$X$','$Y$', 'Interpreter', 'latex');
box on;
hold on;
xlabel('\itn');
% grid on;
set(gca,'FontName','Times New Roman','FontSize',12,'FontWeight','bold');