%% Latency visualizations

doSave = false;
figFormat = 'png'; %'epsc'

%% Simulations

trials = 10000;

s1 = simDisco([23,157], [29,69], trials);
s2 = simDisco([37,43], [37,43], trials);
s3 = simDisco([23,157], [23,157], trials);

disp(['sim [23,157],[29,69] mean: ', num2str(mean(s1)), ' slots, median: ', num2str(median(s1)), ' slots, max: ', num2str(max(s1)), ' slots'])
disp(['sim [37,43], [37,43] mean: ', num2str(mean(s2)), ' slots, median: ', num2str(median(s2)), ' slots, max: ', num2str(max(s2)), ' slots'])
disp(['sim [23,157],[23,157] mean: ', num2str(mean(s3)), ' slots, median: ', num2str(median(s3)), ' slots, max: ', num2str(max(s3)), ' slots'])


%% Measurements
t_slot = 0.025; %ms 
close all

meas1 = csvread('../test/Formated Data/Result_23_157_29_67_new3.csv',1,0);
meas2 = csvread('../test/Formated Data/result_37_43_new2.csv',1,0);
meas3 = csvread('../test/Formated Data/Result_23_157_new3.csv',1,0);

m1 = meas1(:,4)./t_slot;
m2 = meas2(:,4)./t_slot;
m3 = meas3(:,4)./t_slot;

disp(['meas [23,157],[29,69] mean: ', num2str(mean(m1)), ' slots, median: ', num2str(median(m1)), ' slots, max: ', num2str(max(m1)), ' slots'])
disp(['meas [37,43], [37,43] mean: ', num2str(mean(m2)), ' slots, median: ', num2str(median(m2)), ' slots, max: ', num2str(max(m2)), ' slots'])
disp(['meas [23,157],[23,157] mean: ', num2str(mean(m3)), ' slots, median: ', num2str(median(m3)), ' slots, max: ', num2str(max(m3)), ' slots'])


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
if doSave
    saveas(gcf,'../Test/Plots/plotSim',figFormat)
end

%% Plot measurements only

figure(1)
clf
hold on
ecdf(m1);
ecdf(m2);
ecdf(m3);
hold off
title('Empirical CDF')
xlabel('Discovery Latency (Slots)')
ylabel('Fraction of Discoveries')
legend(...
    'pp_i = (23,157), pp_j = (29,67)',...
    'pp_i = (37,43),   pp_j = (37,43)',...
    'pp_i = (23,157), pp_j = (23,157)',...       
    'Location', 'southeast')
axis([0 10000 0 1])
if doSave
    saveas(gcf,'../Test/Plots/plotMeas',figFormat)
end
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
ecdf(m2);
hold off

title('Simulated and Measured Empirical CDF')
xlabel('Discovery Latency (Slots)')
ylabel('Fraction of Discoveries')
legend(...
    'simulated pp_i = (37,43),   pp_j = (37,43)',...
    'measured pp_i = (37,43),   pp_j = (37,43)',...  
    'Location', 'southeast')
axis([0 5000 0 1])
if doSave
    saveas(gcf,'../Test/Plots/plotMeasAndSim37_43',figFormat)
end
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
ecdf(m1);
ecdf(m2);
ecdf(m3);
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
axis([0 5000 0 1])

if doSave
    saveas(gcf,'../Test/Plots/plotMeasAndSimAll',figFormat)
end

