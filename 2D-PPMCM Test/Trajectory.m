clear;
clc;
close;

len=10000;
t=1:len+1;
x=zeros(1,len+1);
y=zeros(1,len+1);
z=zeros(1,len+1);
u=zeros(1,len+1);
 x(1)=0.2;  
 y(1)=0.3;
for i=1:len  

x(i+1)=mod((exp(6)+6^2)*(x(i)+y(i)^2)/(1+6^2),1);
y(i+1)=mod((exp(6)+6^2)*y(i)/(1+6^2),1);

end

plot(x,y,'b.')
xlabel('\itx_i');ylabel('\ity_i');
hold on;


highlight_x = 0.2;
highlight_y = 0.3;
h = scatter(highlight_x, highlight_y, 100, 'r', 'filled'); 




set(gca,'XTick',[0:0.5:1]);
set(gca,'YTick',[0:0.5:1]);
 set(gca,'FontName','Times New Roman','FontSize',12,'FontWeight','bold');
 legend(h, sprintf('(%0.1f, %0.1f)', highlight_x, highlight_y),'FontName','Times New Roman','FontSize',16,'Location','Northwest');
