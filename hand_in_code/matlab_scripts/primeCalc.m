% Primepairs
clear; close all;

saveFormat = 'epsc'; %'png';

p  = primes(200)
C = nchoosek(p,2)

DC = 1./C(:,1) + 1./C(:,2)
[DC, ii] = sort(DC)
C = C(ii,:)

fig = figure(1);
left_color =  [0      0.4470 0.7410];
right_color = [0.8500 0.3250 0.0980];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
yyaxis left
plot(DC,'.')
ylabel('Duty Cycle')

yyaxis right
plot(abs(C(:,1)./C(:,2)),'o'); 
ylabel('Symmetry (p1/p2)')

xlabel('Prime Pair Index')
%grid on; ax = gca; ax.XTick = 1:50:length(DC)
%legend('duty cycle','symmetricity (p1/p2)', 'Location','northeast')
title('Prime Pair Duty Cycles and Symmetry')
saveas(gcf,'DcSyncPlot',saveFormat)

figure(2);
h = histogram(DC,100)
ax = gca; ax.XTick = 0:0.05:1
title('Prime Pair Duty Cycle Histogram')
saveas(gcf,'DcHistPlot',saveFormat)