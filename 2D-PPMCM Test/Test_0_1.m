clc;
clear all;
close

%%  0-1 test for 2D- PPMCM
clc
n = 5000;
cx = zeros(1,n); cy = zeros(1,n);
cx(1) = 0.2; cy(1) = 0.3;   a = 6; b=6;   
for j = 1 : n-1
    cx(j+1)=mod((exp(b)+a^2)*(cx(j)+cy(j)^2)/(1+a^2),1);
    cy(j+1)=mod((exp(a)+b^2)*cy(j)/(1+b^2),1);
end

kmedian=z1test(cy);
