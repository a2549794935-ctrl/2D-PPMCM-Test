clear;
clc;
close

c=2;
d=1;
a_range=0.1:0.08:10;
b_range=0.1:0.08:10;
e=1;

[A,U]=meshgrid(b_range,a_range); 
Z= zeros(length(b_range), length(a_range));



  for i = 1:length(b_range)
    for j = 1:length(a_range)
        b = b_range(i);
        a = a_range(j);

    x=0.2;
    y=0.3;
    for n=1:2000
       [x,y]=MY2D(x,y,a,b,c,d);
    end    

       Z1(i,j)=x;
       Z2(i,j)=y; 
    end
  end

figure(1);

      surf(U,A,Z1,'FaceColor', 'b');
      scatter3(U(:), A(:), Z1(:), 'b.');
      
      xlabel('{\ita}'),ylabel('{\itb}'),zlabel('{\itx_i}');
     axis([0,10,0,10,0,1]);
set(gca,'XTick',[0:5:10]);
set(gca,'YTick',[0:5:10]);
set(gca,'ZTick',[0:0.5:1]);

    set(gca,'FontName','Times New Roman','FontSize',12,'FontWeight','bold');
    hold on;
    grid on;
   box on;
 

   figure(2);

      surf(U,A,Z2,'FaceColor', 'b');
      scatter3(U(:), A(:), Z2(:), 'b.');
      
      xlabel('{\ita}'),ylabel('{\itb}'),zlabel('{\ity_i}');
     axis([0,10,0,10,0,1]);
set(gca,'XTick',[0:5:10]);
set(gca,'YTick',[0:5:10]);
set(gca,'ZTick',[0:0.5:1]);

    set(gca,'FontName','Times New Roman','FontSize',12,'FontWeight','bold');
    hold on;
    grid on;
   box on;
 