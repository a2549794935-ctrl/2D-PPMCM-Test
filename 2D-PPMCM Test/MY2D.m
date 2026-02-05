function [ x_final,y_final ] = MY2D( x,y,a,b,c,d )

%% MY

  x_final=mod((exp(b)+a^2)*(x+y^c)/(1+a^2),d);
  y_final=mod((exp(a)+b^2)*y/(1+b^2),d);

end

