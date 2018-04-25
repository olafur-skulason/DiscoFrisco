%% Latency measurement visualizations

meas = randn(100,1)+10; %normalize data to slots
t_mean = mean(meas)
t_slot = 30; %ms

disp(['Mean Discovery Latency is ', ...
    num2str(t_mean), ' slots or ', num2str(t_mean*t_slot), ' ms'  ])

figure(1)
[cdf_y, cdf_x] = ecdf(meas);
title('Empirical CDF')
xlabel('Discovery Latency (Slots)')
ylabel('Fraction of Discoveries')

figure(2); 
nbins = 10;
ecdfhist(cdf_y,cdf_x, nbins);
title('Historgram')
xlabel('Discovery Latency (Slots)')
ylabel('Fraction of Discoveries')
