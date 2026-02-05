clc; clear;

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

nbins = 15;
[counts, xedges, yedges] = histcounts2(x, y, nbins);

xcenters = (xedges(1:end-1) + xedges(2:end)) / 2;
ycenters = (yedges(1:end-1) + yedges(2:end)) / 2;
[xx, yy] = meshgrid(xcenters, ycenters);
dx = xedges(2) - xedges(1); 
dy = yedges(2) - yedges(1);

figure;
hold on;

for i = 1:nbins
    for j = 1:nbins
        z = counts(i,j);
        if z > 0
            bar3d(xx(i,j), yy(i,j), z, dx, dy, ...
                  'FaceColor', [0.6 0.8 1], ...
                  'EdgeColor', 'k', ...
                  'FaceAlpha', 0.6);
        end
    end
end

xlabel('\itx'); ylabel('\ity'); zlabel('Frequency');
view(135, 30);
grid on; box on;
axis tight;

desired_ticks = [0, 0.5, 1];

[~, xtick_idx] = min(abs(xcenters' - desired_ticks), [], 1);
[~, ytick_idx] = min(abs(ycenters' - desired_ticks), [], 1);

xticks(xcenters(xtick_idx));
xticklabels({'0', '0.5', '1'});

yticks(ycenters(ytick_idx));
yticklabels({'0', '0.5', '1'});
set(gca,'FontName','Times New Roman','FontSize',12,'FontWeight','bold');
