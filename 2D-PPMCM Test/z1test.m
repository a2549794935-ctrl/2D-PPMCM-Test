

function kmedian=z1test(x)
s=size(x); if s(2)==1; x=x'; end
N=length(x); j=[1:N];
t=[1:round(N/10)];
M=zeros(1,round(N/10));
c=pi/5+rand(1,100)*3*pi/5;  % 100 random c values in [pi/5,4pi/5]
for its=1:100
   p=cumsum(x.*cos(j*c(its)));q=cumsum(x.*sin(j*c(its)));
   for n=1:round(N/10)
      M(n)=mean( (p(n+1:N)-p(1:N-n)).^2 + (q(n+1:N)-q(1:N-n)).^2 )- ...
           mean(x)^2*(1-cos(n*c(its)))/(1-cos(c(its)));
   end
   kcorr(its)=corr(t',M');
end



% Two crude attempts to check for oversampling:
if (max(x)-min(x) )/mean(abs(diff(x))) > 10 | ...
       median(kcorr(c<mean(c))) - median(kcorr(c>mean(c))) > 0.5
   disp('Warning: data is probably oversampled.')
   disp('Use coarser sampling or reduce the maximum value of c.')
end
% plot(p,q,'-','color', [0.6350 0.0780 0.1840],'Markersize',5);
plot(p,q,'-','color', [0 0.4470 0.7410],'Markersize',5);
xlabel('\itp_c');
ylabel('\itq_c');
% plabel('p','FontSize',12);qlabel('q','FontSize',12);
kmedian=median(kcorr);
box on;
set(gca, 'FontName','Times New Roman','FontSize',12,'FontWeight','bold');
