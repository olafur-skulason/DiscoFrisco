%% Simulations

trials = 10000;

s1 = simDisco([23,157], [29,69], trials);
s2 = simDisco([37,43], [37,43], trials);
s3 = simDisco([23,157], [23,157], trials);

%% Measurements
t_slot = 0.100; %ms 
close all

meas1 = csvread('../test/Formated Data/Result_23_157_29_67_new3.csv',1,0);
meas2 = csvread('../test/Formated Data/result_37_43_new2.csv',1,0);
meas3 = csvread('../test/Formated Data/Result_23_157_new3.csv',1,0);

t_disco1 = meas1(:,4)./t_slot;
t_disco2 = meas2(:,4)./t_slot;
t_disco3 = meas3(:,4)./t_slot;

disp(['Meas1 mean: ', num2str(mean(t_disco1)), ' slots, max: ', num2str(max(t_disco1)), ' slots'])
disp(['Meas2 mean: ', num2str(mean(t_disco2)), ' slots, max: ', num2str(max(t_disco2)), ' slots'])
disp(['Meas3 mean: ', num2str(mean(t_disco3)), ' slots, max: ', num2str(max(t_disco3)), ' slots'])


%% Plot simulations only

figure(1)
ps1 = ecdf(s1);
ps2 = ecdf(s2);
ps3 = ecdf(s3);
clf
hold on
%sim
plot(ps1, '--')
plot(ps2, '--')
plot(ps3, '--')

hold off

title('Simulated CDF')
xlabel('Discovery Latency (Slots)')
ylabel('Fraction of Discoveries')
legend(...
    'pp_i = (23,157), pp_j = (29,67)',...
    'pp_i = (37,43),   pp_j = (37,43)',...
    'pp_i = (23,157), pp_j = (23,157)',...       
    'Location', 'southeast')
axis([0 3611 0 1])
saveas(gcf,'../Test/Plots/plotSim','epsc')

%% Plot measurements only

figure(1)
clf
hold on
ecdf(t_disco1);
ecdf(t_disco2);
ecdf(t_disco3);
hold off
title('Empirical CDF')
xlabel('Discovery Latency (Slots)')
ylabel('Fraction of Discoveries')
legend(...
    'pp_i = (23,157), pp_j = (29,67)',...
    'pp_i = (37,43),   pp_j = (37,43)',...
    'pp_i = (23,157), pp_j = (23,157)',...       
    'Location', 'southeast')
axis([0 3611 0 1])
saveas(gcf,'../Test/Plots/plotMeas','epsc')

%% Plot single meas and sim

figure(1)
ps2 = ecdf(s2);
clf
hold on
ax = gca; ax.ColorOrderIndex = 2;
%sim
plot(ps2, '--')
ax = gca; ax.ColorOrderIndex = 2;
%meas
ecdf(t_disco2);
hold off

title('Simulated and Measured Empirical CDF')
xlabel('Discovery Latency (Slots)')
ylabel('Fraction of Discoveries')
legend(...
    'simulated pp_i = (37,43),   pp_j = (37,43)',...
    'measured pp_i = (37,43),   pp_j = (37,43)',...  
    'Location', 'southeast')
saveas(gcf,'../Test/Plots/plotMeasAndSim37_43','epsc')

%% Plot all together

figure(1)
ps1 = ecdf(s1);
ps2 = ecdf(s2);
ps3 = ecdf(s3);
clf
hold on
%sim
plot(ps1, '--')
plot(ps2, '--')
plot(ps3, '--')

ax = gca;
ax.ColorOrderIndex = 1;

%meas
ecdf(t_disco1);
ecdf(t_disco2);
ecdf(t_disco3);
hold off

title('Simulated and Measured Empirical CDF')
xlabel('Discovery Latency (Slots)')
ylabel('Fraction of Discoveries')
legend(...
    'simulated pp_i = (23,157), pp_j = (29,67)',...
    'simulated pp_i = (37,43),   pp_j = (37,43)',...
    'simulated pp_i = (23,157), pp_j = (23,157)',...    
    'measured pp_i = (23,157), pp_j = (29,67)',...
    'measured pp_i = (37,43),   pp_j = (37,43)',...
    'measured pp_i = (23,157), pp_j = (23,157)',...    
    'Location', 'southeast')
axis([0 3611 0 1])
saveas(gcf,'../Test/Plots/plotMeasAndSimAll','epsc')


