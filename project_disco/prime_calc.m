% Primepairs
clear;

p  = primes(100)
C = nchoosek(p,2)

DC = 1./C(:,1) + 1./C(:,2)

figure(1)
plot(DC,'o')
hold on; 
plot(abs(C(:,1)./C(:,2)),'o'); 
hold off;
grid on; ax = gca; ax.XTick = 1:length(DC)
legend('duty cycle','symmetricity (p1/p2)', 'Location','northwest')

figure(2);histogram(DC,100)